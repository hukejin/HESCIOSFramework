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
#import "ColorUtil.h"
#import "ToastUtil.h"

FOUNDATION_EXPORT double HESCIOSFrameworkVersionNumber;
FOUNDATION_EXPORT const unsigned char HESCIOSFrameworkVersionString[];

