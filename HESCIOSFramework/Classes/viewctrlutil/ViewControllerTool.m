//
//  ViewControllerTool.m
//  hybride-master
//
//  Created by 刘俊林 on 2021/6/9.
//

#import "ViewControllerTool.h"

@implementation ViewControllerTool

+(UIViewController *)getViewController:(UIView *)view{
    UIResponder *responder = view.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
