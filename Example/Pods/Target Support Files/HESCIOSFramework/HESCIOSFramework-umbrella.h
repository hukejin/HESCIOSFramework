#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HESCFramework.h"
#import "AnimatorUtil.h"
#import "ColorUtil.h"
#import "TimeUtil.h"
#import "DisplayUtil.h"
#import "HttpUtil.h"
#import "Image2Base64.h"
#import "CheckPermissionUtil.h"
#import "PhotoAlbum.h"
#import "ToastUtil.h"
#import "ViewControllerTool.h"

FOUNDATION_EXPORT double HESCIOSFrameworkVersionNumber;
FOUNDATION_EXPORT const unsigned char HESCIOSFrameworkVersionString[];

