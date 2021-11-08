//
//  DisplayUtil.h
//  ios端 状态栏、导航栏、底部安全距离
//
//  Created by 刘俊林 on 2021/10/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisplayUtil : NSObject

/// 获取状态栏高度
+(int) getStateBarHeight;

/// 获取导航栏高度
+(int) getNavigationBarHeight;

/// 获取底部安全距离
+(int) getBottomSafeHeight;

/// 获取屏幕宽度
+(CGFloat) getScreenWidth;

/// 获取屏幕高度
+(CGFloat) getScreenHeight;

/// 是否是刘海屏
+(bool) isIphoneX;
@end

NS_ASSUME_NONNULL_END
