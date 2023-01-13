//
//  Number4String.h
//  HESCIOSFramework
//  将数字和字符串互换
//  Created by 刘俊林 on 2023/1/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Number4String : NSObject

/**
 将double数据转换为string
 */
+(NSString*) double2string:(double) number;
/**
 将int数据转换为string
 */
+(NSString*) int2string:(int) number;
/**
 将NSInteger数据转换为string
 */
+(NSString*) integer2string:(NSInteger) number;
/**
 将string转换为double
 */
+(double) string2double:(NSString*)str;
/**
 将string转换为int
 */
+(int) string2int:(NSString*)str;
/**
 将string转换为NSInteger
 */
+(NSInteger) string2Integer:(NSString*)str;

@end

NS_ASSUME_NONNULL_END
