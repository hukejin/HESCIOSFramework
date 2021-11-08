//
//  AnimatorUtil.h
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger,Direction){
    Zindex = 0,
    Xindex = 1,
    Yindex = 2
};

@interface AnimatorUtil : NSObject

/// 围绕 x/y/z 轴旋转
/// @param duration 动画时长
/// @param repeatcount 循环次数
/// @param fromangle 开始角度(弧度制：M_PI、M_PI_2、M_PI_4) π、π/2、π/4
/// @param toangle 旋转结束角度(弧度制：M_PI、M_PI_2、M_PI_4) π、π/2、π/4
/// @param direct 绕 X/Y/Z轴旋转
-(CABasicAnimation*) getRotatiionAnimator:(float)duration repeatcount:(float) repeatcount startangle:(float)fromangle endangle:(float)toangle  direct:(Direction)direct;


/// 缩放图形
/// @param scale 缩放倍数
/// @param duration 动画持续时间
-(CABasicAnimation*) getScaleAnimator:(float)scale duration:(float)duration;


/// 平移
/// @param from 开始点位
/// @param toPoint 结束点位
/// @param duration 动画持续时间
-(CABasicAnimation*) getTranslationAnimator:(CGPoint)from toPoint:(CGPoint)toPoint duration:(float)duration;

@end

NS_ASSUME_NONNULL_END
