//
//  PhotoAlbum.m
//  hybride-master
//  相册操作类
//  Created by 刘俊林 on 2021/6/16.
//

#import "PhotoAlbum.h"
#import <AssetsLibrary/AssetsLibrary.h>



@implementation PhotoAlbum{
    SaveResultBlock __result;
}



-(void)downLoadMediaFromWeb:(NSString*)fileUrl error:(SaveResultBlock) errorBlock{
    
    if(fileUrl == nil || fileUrl.length == 0){
        NSError *error = [[NSError alloc] initWithDomain:@"下载地址不能为空" code:404 userInfo:nil];
        errorBlock(error);
        return;
    }
    __result = errorBlock;
    
    NSString *fileLocalPath = [NSString stringWithFormat:@"%@",fileUrl];
    NSString *path = [fileLocalPath stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    
    //下载文件，如果是图片和视频存入系统相册
    
    if([[fileLocalPath lowercaseString] hasSuffix:@".jpg"] || [[fileLocalPath lowercaseString] hasSuffix:@".jpeg"] || [[fileLocalPath lowercaseString] hasSuffix:@".png"]){
        UIImageWriteToSavedPhotosAlbum([UIImage imageWithContentsOfFile:path],self,@selector(image:didFinishSavingWithError:contextInfo:),nil);
    }else if([[fileLocalPath lowercaseString] hasSuffix:@".mp4"] || [[fileLocalPath lowercaseString] hasSuffix:@".ps"]){
        UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if(error == nil){
        
        NSError *error = [[NSError alloc] initWithDomain:@"保存成功" code:200 userInfo:nil];
        __result(error);
        NSLog(@"contextInfo:%@",contextInfo);
    }else{
        NSError *error = [[NSError alloc] initWithDomain:@"保存失败" code:400 userInfo:nil];
        __result(error);
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo: (void *)contextInfo {
    if(error == nil){
        NSError *error = [[NSError alloc] initWithDomain:@"保存成功" code:200 userInfo:nil];
        __result(error);
    }else{
        NSError *error = [[NSError alloc] initWithDomain:@"保存失败" code:400 userInfo:nil];
        __result(error);
    }
}

-(BOOL)saveImageToAlbum:(NSString*)filePath fileName:(NSString*)fileName image:(UIImage*)image{
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    if(![fileManager fileExistsAtPath:filePath]){
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *uniquePath=[filePath stringByAppendingPathComponent:fileName];
    BOOL result=[UIImageJPEGRepresentation(image, 1) writeToFile: uniquePath atomically:YES];
    return result;
}

-(BOOL)isFileExistAtPath:(NSString*)fileFullPath{
    BOOL isExist = NO;
    isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileFullPath];
    return isExist;
}

-(NSMutableArray *)getFilenamelistOfType:(NSString *)type fromDirPath:(NSString *)dirPath
{
    NSMutableArray *filenamelist = [[NSMutableArray alloc]init];
    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];

    for (NSString *filename in tmplist) {
        NSString *fullpath = [dirPath stringByAppendingPathComponent:filename];
        if ([self isFileExistAtPath:fullpath]) {
            if ([[filename pathExtension] isEqualToString:type]) {
                [filenamelist addObject:filename];
            }
        }
    }

    return filenamelist;
}

-(UIImage *)changImageRotation:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;

    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);

    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);

    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();

    return newPic;
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }

    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

- (UIImage *)imageByScalingToSize:(CGSize)targetSize :(UIImage *)image
{
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;

    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;

    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;

    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);

    if (!CGSizeEqualToSize(imageSize, targetSize)) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;

        // center the image

        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }


    // this is actually the interesting part:

    UIGraphicsBeginImageContext(targetSize);

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if(newImage == nil) NSLog(@"could not scale image");


    return newImage ;
}

-(NSPUIimageType) NSPUIimagetypeFromNSdata:(NSData*) imagedata{
    if(imagedata.length > 4){
        const unsigned char *bytes = [imagedata bytes];
        if(bytes[0] == 0xff && bytes[1] == 0xd8 && bytes[2] == 0xff)
            return NSPUIimageType_JPEG;
        else if(bytes[0] == 0x89 && bytes[1] == 0x50 && bytes[2] == 0x4e && bytes[2] == 0x47)
            return NSPUIimageType_PNG;
    }
    return NSPUIimageType_Unkown;
}

-(NSArray *)filesByPath:(NSString *)path suffix:(NSString*)suffix{
    NSFileManager *manager = [NSFileManager defaultManager];
    //列举出文件路径下的目录
    NSDirectoryEnumerator *direnum = [manager enumeratorAtPath:path];
    NSMutableArray *files = [NSMutableArray array];
    NSString *file;
    while ((file = [direnum nextObject])) {
        if(file == nil)
            break;
        
        if(suffix != nil){
            if ([[file pathExtension] isEqualToString: suffix]) {
                [files addObject:[path stringByAppendingPathComponent:file]];
            }
        }else{
            [files addObject:[path stringByAppendingPathComponent:file]];
        }
        
    }
    return files;
}

@end
