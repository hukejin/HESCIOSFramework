//
//  AnimatorUtil.m
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/9/23.
//

#import "AnimatorUtil.h"

@implementation AnimatorUtil

-(CABasicAnimation*) getRotatiionAnimator:(float)duration repeatcount:(float) repeatcount startangle:(float)fromangle endangle:(float)toangle  direct:(Direction)direct{
    CABasicAnimation* rotationAnimation;
    if(direct == Zindex)
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    else if(direct == Xindex)
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    else
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat: fromangle ];
    rotationAnimation.toValue = [NSNumber numberWithFloat: toangle ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeatcount;
    return rotationAnimation;
}

-(CABasicAnimation*) getScaleAnimator:(float)scale duration:(float)duration{
    CABasicAnimation* scaleAnimation;
    scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = duration;
    scaleAnimation.toValue = [NSNumber numberWithFloat:scale];
    return scaleAnimation;
}

-(CABasicAnimation*) getTranslationAnimator:(CGPoint)from toPoint:(CGPoint)toPoint duration:(float)duration{
    CABasicAnimation* translationAnimation;
    translationAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    translationAnimation.duration = duration;
    translationAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    translationAnimation.fromValue = [NSValue valueWithCGPoint:from];
    return translationAnimation;
}

@end
