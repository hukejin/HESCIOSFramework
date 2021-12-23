//
//  PhotoAlbum.h
//  hybride-master
//  相册操作类,将图片、视频保存到相册里
//  Created by 刘俊林 on 2021/6/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SaveResultBlock)(NSError *error);

typedef NS_ENUM(NSInteger,NSPUIimageType) {
    NSPUIimageType_JPEG,
    NSPUIimageType_PNG,
    NSPUIimageType_Unkown
};

@interface PhotoAlbum : NSObject


/// 下载图片、视频到相册里
/// @param fileUrl 附件下载好的临时路径
/// @param errorBlock 结果回调，如果为nil表示保存成功
-(void)downLoadMediaFromWeb:(NSString*)fileUrl error:(SaveResultBlock) errorBlock;


/// 保存image到指定目录
/// @param filePath 要保存的文件路径
/// @param fileName 文件名称
/// @param image 原文件image对象
-(BOOL)saveImageToAlbum:(NSString*)filePath fileName:(NSString*)fileName image:(UIImage*)image;

///  检测文件是否存在
/// @param fileFullPath 要检测的文件路径
-(BOOL)isFileExistAtPath:(NSString*)fileFullPath;


/// 查询路径下的相关后缀名文件列表
/// @param type 文件后缀
/// @param dirPath 查询目录
-(NSMutableArray *)getFilenamelistOfType:(NSString *)type fromDirPath:(NSString *)dirPath;

/// 图像转角度
/// @param image 原图片image
/// @param orientation 选择角度（枚举）多用于拍照图片方向错误
-(UIImage *)changImageRotation:(UIImage *)image rotation:(UIImageOrientation)orientation;

/// 图片进行压缩
/// @param image 原图
/// @param maxFileSize 文件大小如 3M、100K
- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize;

/// 图片缩放到对应尺寸
/// @param targetSize 目标宽高
/// @param image 原图image
- (UIImage *)imageByScalingToSize:(CGSize)targetSize :(UIImage *)image;

/// 判断当前image是jpg还是png格式
/// @param imagedata 判断当前image是jpg还是png
-(NSPUIimageType) NSPUIimagetypeFromNSdata:(NSData*) imagedata;

/// 根据后缀来选择文件
/// @param path 文件夹路径
/// @param suffix 文件后缀
-(NSArray *)filesByPath:(NSString *)path suffix:(nullable NSString*)suffix;

@end

NS_ASSUME_NONNULL_END
