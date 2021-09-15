//
//  ColorUtil.h
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/9/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorUtil : NSObject
/**
 十六进制字符串转RGB  如 #FF00FF
 */
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;
/**
 十六进制字符串 转RGB，加入alpha
 */
+(UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha;
/**
 十六进制转RGB 如 0xFFFF00
 */
+(UIColor *)colorWithRGBHex:(UInt32)hex;
/**
 十六进制转RGB 如 0xFFFF00FF(RGBA)
 */
+(UIColor *)colorWithRGBAlphaHex:(UInt32)hex;
/**
 十六进制转RGB 如 0xFFFF00，加入alpha
 */
+(UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
