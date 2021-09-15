//
//  ColorUtil.m
//  HESCIOSFramework
//
//  Created by 刘俊林 on 2021/9/15.
//

#import "ColorUtil.h"

@implementation ColorUtil

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    if (stringToConvert.length == 0) {
        return [UIColor blackColor];
    }
    if ([stringToConvert hasPrefix:@"#"]) {
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    if ([stringToConvert containsString:@"0x"]) {
        stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    }
    
    if ([stringToConvert containsString:@"0X"]) {
        stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    }
    
    if (stringToConvert.length==3) {
        stringToConvert = [NSString stringWithFormat:@"%c%c%c%c%c%c",
                           [stringToConvert characterAtIndex:0],
                           [stringToConvert characterAtIndex:0],
                           [stringToConvert characterAtIndex:1],
                           [stringToConvert characterAtIndex:1],
                           [stringToConvert characterAtIndex:2],
                           [stringToConvert characterAtIndex:2]];
    }
    if (stringToConvert.length==4) {
        stringToConvert = [NSString stringWithFormat:@"%c%c%c%c%c%c%c%c",
                           [stringToConvert characterAtIndex:0],
                           [stringToConvert characterAtIndex:0],
                           [stringToConvert characterAtIndex:1],
                           [stringToConvert characterAtIndex:1],
                           [stringToConvert characterAtIndex:2],
                           [stringToConvert characterAtIndex:2],
                           [stringToConvert characterAtIndex:3],
                           [stringToConvert characterAtIndex:3]];
    }
    
    
    NSLog(@"stringToConvert %@",stringToConvert);
    if (stringToConvert.length==8) {
        NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
               
               unsigned hexNum;
               
               if(![scanner scanHexInt:&hexNum]) {
                   return nil;
               }
               
               return [ColorUtil colorWithRGBAlphaHex:hexNum];
        
    }else if (stringToConvert.length==6) {
        NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
        
        unsigned hexNum;
        
        if(![scanner scanHexInt:&hexNum]) {
            return nil;
        }
        
        return [ColorUtil colorWithRGBHex:hexNum];
    }else{
        return nil;
    }
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha{
    if (stringToConvert.length == 0) {
        return [UIColor blackColor];
    }
    if ([stringToConvert hasPrefix:@"#"]) {
        stringToConvert = [stringToConvert substringFromIndex:1];
    }
    if ([stringToConvert containsString:@"0x"]) {
        stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    }
    
    if ([stringToConvert containsString:@"0X"]) {
        stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    }
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    
    unsigned hexNum;
    
    if(![scanner scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [ColorUtil colorWithRGBHex:hexNum withAlpha:alpha];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    NSLog(@"%X",hex);
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r /255.0f
                         green:g /255.0f
                          blue:b /255.0f
                         alpha:1.0f];
}

+ (UIColor *)colorWithRGBAlphaHex:(UInt32)hex {
    NSLog(@"%X",hex);
    
    int r = (hex >> 24) & 0xFF;
    int g = (hex >> 16) & 0xFF;
    int b = (hex>> 8) & 0xFF;
    int alpha = hex & 0xFF;
    return [UIColor colorWithRed:r /255.0f
                         green:g /255.0f
                          blue:b /255.0f
                           alpha:alpha/255.0f];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(CGFloat)alpha{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    return [UIColor colorWithRed:r /255.0f
                           green:g /255.0f
                            blue:b /255.0f
                           alpha:alpha];
}


@end
