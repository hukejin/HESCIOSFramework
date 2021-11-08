//
//  TimeUtil.m
//  hybride-master
//
//  Created by 刘俊林 on 2021/7/26.
//

#import "TimeUtil.h"

@implementation TimeUtil

/**
 获取当前默认时间
 */
-(NSString *) getSystemTimeDefault{
    return [self getSystemTime:TimeFormatcodeDefault];
}

/**
 获取当前时间，可选格式为
 */
-(NSString *) getSystemTime:(TimeFormatcode )timeStyle{
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:timeZone];
    
    switch (timeStyle) {
        case TimeFormatcodeDefault:
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
            break;
        case TimeFormatcodeYMD:
            [formatter setDateFormat:@"YYYY-MM-dd"];
            break;
        case TimeFormatcodeHMS:
            [formatter setDateFormat:@"HH:mm:ss"];
            break;
        case TimeFormatcodeMDHM:
            [formatter setDateFormat:@"MM-dd HH:mm"];
            break;
        case TimeFormatcodeMD:
            [formatter setDateFormat:@"MM-dd"];
            break;
        case TimeFormatcodeYMDHM:
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
            
        default:
            break;
    }
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}


/**
 获取当前时间的时间戳
 */
-(NSTimeInterval) getTimeTempCurrenttime{
    NSString *time = [self getSystemTimeDefault];
    return [self getTimeTemp:time];
}

/**
 获取指定标准时间的时间戳
 */
-(NSTimeInterval) getTimeTemp:(NSString *) timestring{
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSDate *dateNow = [formatter dateFromString:timestring];
    return [dateNow timeIntervalSince1970]*1000;
}

/**
 将时间戳转为标准时间
 */
-(NSString *) getTimeTemp2SystemTime:(NSTimeInterval) timeTemp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeTemp/1000];

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:timeZone];
    NSString *nstime = [formatter stringFromDate:confromTimesp];
    
    return nstime;
}

@end
