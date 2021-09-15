//
//  LJLViewController.m
//  HESCIOSFramework
//
//  Created by napolun007@gmail.com on 09/14/2021.
//  Copyright (c) 2021 napolun007@gmail.com. All rights reserved.
//

#import "LJLViewController.h"
#import <HESCFramework.h>

@interface LJLViewController ()

@end

@implementation LJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIColor *color = [ColorUtil colorWithHexString:@"#ff00ff"];
    NSLog(@"a:%@",color);
    UIColor *color1 = [ColorUtil colorWithHexString:@"#ff00ff" withAlpha:0.5];
    NSLog(@"b:%@",color1);
    UIColor *color2 = [ColorUtil colorWithRGBHex:0Xff00ff];
    NSLog(@"c:%@",color2);
    UIColor *color3 = [ColorUtil colorWithRGBHex:0Xff00ff withAlpha:0.5];
    NSLog(@"d:%@",color3);
    UIColor *color4 = [ColorUtil colorWithRGBAlphaHex:0xff00ff3E];
    NSLog(@"e:%@",color4);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
