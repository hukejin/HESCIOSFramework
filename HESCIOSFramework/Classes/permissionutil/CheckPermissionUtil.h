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

@interface CheckPermissionUtil : NSObject

/// 检测是否允许使用位置
-(Boolean) checkLocation;

/// 检测是否允许使用相机
-(Boolean) checkCapture;

/// 检测是否允许使用相册
-(Boolean) checkAlum;

@end

NS_ASSUME_NONNULL_END
