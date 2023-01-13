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

+(UIViewController *) getCurViewctrl{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UIViewController *currentViewController = window.rootViewController;
    if(currentViewController == nil)
        return nil;
    while (true) {
        if(currentViewController.presentedViewController){
            currentViewController = currentViewController.presentedViewController;
        }else{
            if([currentViewController isKindOfClass:[UINavigationController class]]){
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            }else if([currentViewController isKindOfClass:[UITabBarController class]]){
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            }else{
                break;
            }
        }
    }
    return currentViewController;
}
@end
