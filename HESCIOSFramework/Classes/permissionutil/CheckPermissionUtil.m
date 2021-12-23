//
//  CheckPermissionUtil.m
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/12/23.
//

#import "CheckPermissionUtil.h"

@implementation CheckPermissionUtil

-(Boolean) checkLocation{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways){
        return true;
    }
    return false;
}
-(Boolean) checkCapture{
    //检测相机权限
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        return false;
    }
    return true;
}
-(Boolean) checkAlum{
    //检测相册权限
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if(status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied){
        return false;
    }
    return true;
}

@end
