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

-(Boolean) checkLocation;
-(Boolean) checkCapture;
-(Boolean) checkAlum;

@end

NS_ASSUME_NONNULL_END
