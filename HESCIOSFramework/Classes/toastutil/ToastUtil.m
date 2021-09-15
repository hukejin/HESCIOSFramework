//
//  ToastUtil.m
//  hybride-master
//
//  Created by 刘俊林 on 2021/7/8.
//

#import "ToastUtil.h"
#import "MBProgressHUD.h"

@implementation ToastUtil

+(void) toastInshorttime:(NSString *)title view:(UIView *)masterView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:masterView animated:YES];
    hud.label.text =  title;
    hud.mode = MBProgressHUDModeText;
    [hud.bezelView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [hud setContentColor:[UIColor whiteColor]];
    
    hud.bezelView.layer.cornerRadius = 18;
    hud.bezelView.layer.masksToBounds = YES;
    
    

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}
+(void) toastInLongtime:(NSString *)title view:(UIView *)masterView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:masterView animated:YES];
    hud.label.text =  title;
    hud.mode = MBProgressHUDModeText;
    [hud.bezelView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [hud setContentColor:[UIColor whiteColor]];
    hud.bezelView.layer.cornerRadius = 18;
    hud.bezelView.layer.masksToBounds = YES;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
}

@end
