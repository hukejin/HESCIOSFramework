//
//  Image2Base64.m
//  hybride-master
//  将图片转base64/ base64转图片UIImage
//  Created by 刘俊林 on 2021/6/17.
//

#import "Image2Base64.h"

@implementation Image2Base64

-(UIImage *)base64ToImg:(NSString *)string{
    
    if(string == nil || string.length == 0)
        return nil;
    
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];

    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}

-(NSString *)imgTobase64:(UIImage *)image{
    if(image == nil)
        return @"";
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageString;
}

@end
