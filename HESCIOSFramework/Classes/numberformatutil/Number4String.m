//
//  Number4String.m
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2023/1/13.
//

#import "Number4String.h"

@implementation Number4String

+(NSString*) double2string:(double)number{
    NSNumber *numobj = [NSNumber numberWithDouble:number];
    NSString *string = [NSString stringWithFormat:@"%@",numobj];
    return string;
}

+(NSString*) int2string:(int) number{
    NSNumber *numobj = [NSNumber numberWithInt:number];
    NSString *string = [NSString stringWithFormat:@"%@",numobj];
    return string;
}

+(NSString*) integer2string:(NSInteger) number{
    NSNumber *numobj = [NSNumber numberWithInteger:number];
    NSString *string = [NSString stringWithFormat:@"%@",numobj];
    return string;
}

+(double) string2double:(NSString*)str{
    return [str doubleValue];
}

+(int) string2int:(NSString*)str{
    return [str intValue];
}

+(NSInteger) string2Integer:(NSString*)str{
    return [str integerValue];
}
@end
