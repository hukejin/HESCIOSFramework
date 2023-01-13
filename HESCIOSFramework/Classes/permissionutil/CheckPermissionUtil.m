//
//  CheckPermissionUtil.m
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/12/23.
//

#import "CheckPermissionUtil.h"

@implementation CheckPermissionUtil

+ (instancetype)manager {
    static CheckPermissionUtil *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CheckPermissionUtil alloc]init];
    });
    return manager;
}

-(AuthorizationStatus) checkLocation{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
        return AuthorizationStatusDenied;
    }
    if (status == AVAuthorizationStatusAuthorized) {
        return AuthorizationStatusAuthorized;
    }
    return AuthorizationStatusNotDetermined;
}
-(AuthorizationStatus) checkCapture{
    //检测相机权限
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
            return AuthorizationStatusDenied;
    }
    if (authStatus == AVAuthorizationStatusAuthorized) {
        return AuthorizationStatusAuthorized;
    }
    return AuthorizationStatusNotDetermined;
}
-(AuthorizationStatus) checkAlum{
    //检测相册权限
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
        return AuthorizationStatusDenied;
    }
    if (status == AVAuthorizationStatusAuthorized) {
        return AuthorizationStatusAuthorized;
    }
    return AuthorizationStatusNotDetermined;
}

-(AuthorizationStatus) checkMicrophone{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied) {
        return AuthorizationStatusDenied;
    }
    if (status == AVAuthorizationStatusAuthorized) {
        return AuthorizationStatusAuthorized;
    }
    return AuthorizationStatusNotDetermined;
    
}
/**
 申请相机权限
 */
-(void)requestAuthorizationForCamera{
    if ([[CheckPermissionUtil manager] checkCapture] == AuthorizationStatusDenied) {
        [[CheckPermissionUtil manager] alertWithTitle:@"无法使用相机" Message:@"请在设置中允许使用相机"];
    }

}
/**
 申请相册权限
 */
-(void)requestAuthorizationForPhotoLibrary{
    if ([[CheckPermissionUtil manager] checkAlum] == AuthorizationStatusDenied) {
        [[CheckPermissionUtil manager] alertWithTitle:@"无法使用相册" Message:@"请在设置中允许使用相册"];
    }
}
/**
 申请麦克风权限
 */
-(void)requestAuthorizationForMicrophone{
    if ([[CheckPermissionUtil manager] checkMicrophone] == AuthorizationStatusDenied) {
        [[CheckPermissionUtil manager] alertWithTitle:@"无法使用麦克风" Message:@"请在设置中允许使用麦克风"];
    }
}
/**
 申请定位权限
 */
-(void)requestAuthorizationForLocation{
    if ([[CheckPermissionUtil manager] checkLocation] == AuthorizationStatusDenied) {
        [[CheckPermissionUtil manager] alertWithTitle:@"无法使用定位" Message:@"请在设置中允许使用定位"];
    }
}

- (UIViewController *)viewController {
    UIViewController *vc = [[UIApplication sharedApplication].keyWindow rootViewController];
    return vc;
}


- (void)alertWithTitle:(NSString *)title Message:(NSString *)message {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    [alertC addAction:action1];
    [alertC addAction:action2];
    [[[CheckPermissionUtil manager] viewController] presentViewController:alertC animated:YES completion:nil];
}

@end
