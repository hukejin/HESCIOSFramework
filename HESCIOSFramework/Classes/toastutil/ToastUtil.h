//
//  ToastUtil.h
//  hybride-master
//
//  Created by 刘俊林 on 2021/7/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToastUtil : NSObject
/**
 界面停留一秒提示
 */
+(void) toastInshorttime:(NSString *)title view:(UIView *)masterView;
/**
 界面停留2秒提示
 */
+(void) toastInLongtime:(NSString *)title view:(UIView *)masterView;

@end

NS_ASSUME_NONNULL_END
