//
//  Image2Base64.h
//  hybride-master
//  图片转base64字符串、base64字符串转图片
//  Created by 刘俊林 on 2021/6/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface Image2Base64 : NSObject

/**
 base64字符串转为UIImage
 */
-(UIImage *)base64ToImg:(NSString *)string;
/**
 UIImage转换为base64字符串
 */
-(NSString *)imgTobase64:(UIImage *)img;

@end

NS_ASSUME_NONNULL_END
