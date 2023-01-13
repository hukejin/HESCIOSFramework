//
//  ViewControllerTool.h
//  hybride-master
//  viewcontroller 与 UIView之前的变换工具类
//  Created by 刘俊林 on 2021/6/9.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerTool : NSObject

/**
 取当前uiview所在的viewcontroller
 */
+(UIViewController *)getViewController:(UIView *)view;

/**
 获取当前运行的viewcontroller
 */
+(UIViewController *) getCurViewctrl;

@end

NS_ASSUME_NONNULL_END
