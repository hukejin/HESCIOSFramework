//
//  DisplayUtil.m
//  AFNetworking
//
//  Created by 刘俊林 on 2021/10/8.
//

#import "DisplayUtil.h"

@implementation DisplayUtil

/// 获取状态栏高度
+(int) getStateBarHeight{
    return [self isIphoneX]? 44 : 20;
}

/// 获取导航栏高度
+(int) getNavigationBarHeight{
    return [self isIphoneX]? 88 : 64;
}

/// 获取底部安全距离
+(int) getBottomSafeHeight{
    return [self isIphoneX]? 44 : 0;
}

/// 获取屏幕宽度
+(CGFloat) getScreenWidth{
    return [[UIScreen mainScreen]bounds].size.width;
}

/// 获取屏幕高度
+(CGFloat) getScreenHeight{
    return [[UIScreen mainScreen]bounds].size.height;
}

/// 是否是刘海屏
+(bool) isIphoneX{
    CGFloat height = [self getScreenHeight];
    return  ((height == 812.f)||(height == 896.f)||(height == 844.f)||(height == 926.f));
}

@end
