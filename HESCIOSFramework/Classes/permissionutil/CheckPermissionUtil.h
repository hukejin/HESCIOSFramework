//
//  CheckPermissionUtil.h
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/12/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,AuthorizationStatus){
    /**不确定*/
    AuthorizationStatusNotDetermined,//不确定，此时系统尚未向用户申请权限
    /**用户禁止该权限*/
    AuthorizationStatusDenied,
    /**用户已经授权*/
    AuthorizationStatusAuthorized
};

@interface CheckPermissionUtil : NSObject

/**
 检测是否允许使用位置
 */
-(AuthorizationStatus) checkLocation;

/**
 检测是否允许使用相机
 */
-(AuthorizationStatus) checkCapture;

/**
 检测是否允许使用相册
 */
-(AuthorizationStatus) checkAlum;

/**
 检测是否允许使用麦克风
 */
-(AuthorizationStatus) checkMicrophone;
/**
 申请相机权限
 */
-(void)requestAuthorizationForCamera;
/**
 申请相册权限
 */
-(void)requestAuthorizationForPhotoLibrary;
/**
 申请麦克风权限
 */
-(void)requestAuthorizationForMicrophone;
/**
 申请定位权限
 */
-(void)requestAuthorizationForLocation;
@end

NS_ASSUME_NONNULL_END
