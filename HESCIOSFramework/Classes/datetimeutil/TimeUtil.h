//
//  TimeUtil.h
//  hybride-master

//  标准时间--时间戳等等的转化
//  Created by 刘俊林 on 2021/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,TimeFormatcode){
    TimeFormatcodeDefault = 0,//yyyy-MM-dd HH:mm:ss
    TimeFormatcodeYMD = 1 << 0,//yyyy-MM-dd
    TimeFormatcodeHMS = 1 << 1,//HH:mm:ss
    TimeFormatcodeMDHM = 1 << 2,//MM-dd HH:mm
    TimeFormatcodeMD = 1 << 3,//MM-dd
    TimeFormatcodeHM = 1 << 4,//HH:mm
    TimeFormatcodeYMDHM = 1 << 5//yyyy-MM-dd HH:mm
};

@interface TimeUtil : NSObject

/**
 获取当前默认时间
 */
-(NSString *) getSystemTimeDefault;

/**
 获取当前时间，可选格式为
 */
-(NSString *) getSystemTime:(TimeFormatcode )timeStyle;


/**
 获取当前时间的时间戳--long型
 */
-(NSTimeInterval) getTimeTempCurrenttime;

/**
 获取指定标准时间的时间戳（yyyy-MM-dd  HH:mm:ss）
 */
-(NSTimeInterval) getTimeTemp:(NSString *) timestring;

/**
 将时间戳转为标准时间(毫秒)
 */
-(NSString *) getTimeTemp2SystemTime:(NSTimeInterval) timeTemp;

@end

NS_ASSUME_NONNULL_END
