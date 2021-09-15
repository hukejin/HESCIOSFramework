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

+(void) toastInshorttime:(NSString *)title view:(UIView *)masterView;
+(void) toastInLongtime:(NSString *)title view:(UIView *)masterView;

@end

NS_ASSUME_NONNULL_END
