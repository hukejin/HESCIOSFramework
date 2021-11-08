//
//  LJLViewController.m
//  HESCIOSFramework
//
//  Created by napolun007@gmail.com on 09/14/2021.
//  Copyright (c) 2021 napolun007@gmail.com. All rights reserved.
//

#import "LJLViewController.h"
#import <HESCFramework.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
#import "LJL2ViewController.h"




@interface LJLViewController ()<PHPickerViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIScrollView *scrollview;
    CGFloat xindex;
}

@end

@implementation LJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    xindex = 0;
    
    //--------------颜色转换  colorutil
//    UIColor *color = [ColorUtil colorWithHexString:@"#ff00ff"];
//    NSLog(@"a:%@",color);
//    UIColor *color1 = [ColorUtil colorWithHexString:@"#ff00ff" withAlpha:0.5];
//    NSLog(@"b:%@",color1);
//    UIColor *color2 = [ColorUtil colorWithRGBHex:0Xff00ff];
//    NSLog(@"c:%@",color2);
//    UIColor *color3 = [ColorUtil colorWithRGBHex:0Xff00ff withAlpha:0.5];
//    NSLog(@"d:%@",color3);
//    UIColor *color4 = [ColorUtil colorWithRGBAlphaHex:0xff00ff3E];
//    NSLog(@"e:%@",color4);
    
    //--------------图片base64 Image2Base64.h
//    NSString *b64 = @"iVBORw0KGgoAAAANSUhEUgAAAEIAAABCCAMAAADUivDaAAAAeFBMVEUAAAAAAAAAAAAAAAAAAAABAQEAAAAAAAAAAABkZGR3d3f8/Pz6+vr5+fn19fVERET6+vr6+vrz8/OBgYH6+vr6+vr4+Pjv7++Dg4MiIiLx8fH09PT19fXw8PDt7e3t7e1XV1f+/v7////+/v7p6eng4OC1tbX///9l83TnAAAAJ3RSTlMAAgcEChEPDRUaH9fUvqUQxbmXJc/KqooqEpSfmo+Ffxbz9+xsN0FL0gFbAAABgUlEQVRYw7XY207DMAwG4KS0SVkZhXKGAds49P3fkNRLcKQgHO/XfDNpF5/+tE1q1/xXNtbZUk2o5Tf9aWoqA5pUbGgEAkpDIRDQxsoMjZCAcdoPX2RYKqXgvR/v53keWo5RKyTAPy3CvGs5hk5w7iDMm4zQCC4IlyRcjxmhErruV2DiOGHrieAQWmG9dYHgdWiEl4Nw7rxAyILL12EVwiYKHYdQChMJV0FwuWCPFkSiFJ6TkC8DF6h0wt1KLzRReFUKBhY4RBIeSLitFwwmMFEIN0FwlYLJQgThjYSLIHQqwRZCT8vgvcWCFOI9CT2HYEEkWHjsA0EhWJAJCvFJwhAEDlEhmOxSfEShIEw1sV+I754J+bTEU+DXAr8j+HOBP534HpF36kq3U/HzAjXwsxM/wfH3iPw2Q4zpDwPsDQBjLfQXSJeD91p4x6fvXJ1AoN0v3oPLs0QyTjCP4FMRPpvpJ8SdMCEicyo+LeMzO/7lQDYYobJMaAxWrFZgg6skfgACGUs8GjECcwAAAABJRU5ErkJggg==";
//
//    Image2Base64 *imgutil = [[Image2Base64 alloc]init];
//    UIImage *img = [imgutil base64ToImg:b64];
//    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 100, 100)];
//    [imageview setImage:img];
//
//    [self.view addSubview:imageview];
//
//    NSString *base64 = [imgutil imgTobase64:img];
//    NSLog(@"BASE64:%@",base64);
    
    //---------------------标准时间和时间戳的转换
//    TimeUtil *timeUtil = [[TimeUtil alloc]init];
//    NSLog(@"当前时间：%@",[timeUtil getSystemTimeDefault]);
//    NSLog(@"当前时间：%@",[timeUtil getSystemTime:TimeFormatcodeMDHM]);
//    NSLog(@"当前时间戳：%f",[timeUtil getTimeTempCurrenttime]);
//    NSLog(@"2020-03-18 15:00:56转时间戳：%f",[timeUtil getTimeTemp:@"2020-03-18 15:00:56"]);
//    NSLog(@"时间戳转标准时间：%@",[timeUtil getTimeTemp2SystemTime:1631759553413]);
    
    //查询view对应的viewcontroller
//    NSLog(@"viewcontroller:%@",[ViewControllerTool getViewController:self.view]);
    
    
    
    //----------------------调用httputil实例
//    HttpUtil *httpUtil = [[HttpUtil alloc]init];
//    NSString *url = @"http://192.168.0.103:8888/say";
//    [httpUtil getRequest:url params:@{@"name":@"王大力"} headers:@{@"acc":@"123ngege"} response:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObj, NSError * _Nonnull error) {
//        if(!error)
//            NSLog(@"get response:%@",responseObj);
//        else
//            NSLog(@"get error:%@",error);
//    }];
//
//    NSString *url1 = @"http://192.168.0.103:8888/form";
//    [httpUtil postFormRequest:url1 params:@{@"name":@"雷锋",@"age":@(50)} response:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObj, NSError * _Nonnull error) {
//        NSLog(@"post form response:%@",responseObj);
//    }];
//
//    NSString *url2 = @"http://192.168.0.103:8888/person";
//    [httpUtil postJSONRequest:url2 params:@{@"name":@"李逵",@"age":@(10)} response:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObj, NSError * _Nonnull error) {
//        NSLog(@"post json response:%@",responseObj);
//    }];
    
    //---------------------旋转动画-------------------------
//    UIImage *image = [UIImage imageNamed:@"zuzhishow"];
//    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [imageview setImage:image];
//    [self.view addSubview:imageview];
//
//    AnimatorUtil *anima = [[AnimatorUtil alloc]init];
//    CABasicAnimation * caa = [anima getRotatiionAnimator:3.0 repeatcount:2.0 startangle:0 endangle:M_PI direct:Yindex];
//    [imageview.layer addAnimation:caa forKey:@"rotation"];
    

    //-------------------调用系统选图---------------------
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 44, 50, 30)];
//    [btn setTitle:@"选图" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
//    scrollview.showsVerticalScrollIndicator = YES;
//    scrollview.showsHorizontalScrollIndicator = NO;
//    scrollview.contentSize = CGSizeMake(1000, 100);
//    [self.view addSubview:scrollview];
    
   //-----------------------iphone6和iphoneX的刘海屏的状态栏和底部栏-------------------------------------
    int top = [DisplayUtil getStateBarHeight];
    int bottom = [DisplayUtil getBottomSafeHeight];
    
    self.view.layer.borderWidth = 1;
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, [DisplayUtil getNavigationBarHeight], 100, 100)];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tosec:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor colorWithRed:125/255 green:125/255 blue:125/255 alpha:1].CGColor;
    btn.layer.borderWidth = 1;
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, [DisplayUtil getScreenHeight] - 40 - bottom, 100, 40)];
    [btn1 setTitle:@"下111一页" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    [self.navigationItem setTitle:@"大陆"];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    if (@available(iOS 14.0, *)) {
        [self.navigationItem setBackButtonDisplayMode:UINavigationItemBackButtonDisplayModeDefault];
    } else {
        // Fallback on earlier versions
    }
    
    if (@available(iOS 11.0, *)) {
        self.navigationItem.backButtonTitle = @"";
    } else {
        // Fallback on earlier versions
    }
    
    //-----------------------设置下个页面的backbaritem--------------------------
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    //自定义返回按钮的视图，如细化返回图标。
     [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back"]];
     [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back"]];
     //设置tintColor 改变自定图片颜色
     self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    if(@available(ios 15.0, *))
       [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithWhite:255/255.0 alpha:0.5]];
    else
        self.navigationController.navigationBar.barTintColor = [UIColor greenColor];//IOS15以下设置导航栏背景色
     //设置自定义的返回按钮
     self.navigationItem.backBarButtonItem = backItem;
    
}

-(void)tosec:(UIButton *)btn{
    LJL2ViewController *sec = [[LJL2ViewController alloc]init];
    [self.navigationController pushViewController:sec animated:YES];
    
    
}

-(void)btnclick:(UIButton *)btn{
    if (@available(iOS 14, *)) {
        PHPickerConfiguration *config = [[PHPickerConfiguration alloc]init];
        config.selectionLimit = 3;
        config.filter = [PHPickerFilter imagesFilter];
        PHPickerViewController *pick = [[PHPickerViewController alloc]initWithConfiguration:config];
        pick.delegate = self;
        [self presentViewController:pick animated:YES completion:^{
            
        }];
    } else {
        // Fallback on earlier versions
        UIImagePickerController *pick = [[UIImagePickerController alloc]init];
        pick.delegate = self;
        [self presentViewController:pick animated:YES completion:^{
            
        }];
    }
}

- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results API_AVAILABLE(ios(14)){
    NSLog(@"选择了%@",results);
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    for (PHPickerResult *item in results) {
        [item.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
           
            if([object isKindOfClass:[UIImage class]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    xindex++;
                    UIImageView *imageview = [[UIImageView alloc]init];
                    [imageview setImage:object];
                    imageview.layer.cornerRadius = 5;
                    [imageview setBackgroundColor:[UIColor blackColor]];
                    [imageview setContentMode:UIViewContentModeScaleToFill];
                    [imageview setBounds:CGRectMake(0, 0, 100, 100)];
                    [imageview setCenter:CGPointMake(xindex*100, 50)];
                    [scrollview addSubview:imageview];
                    [self.view setNeedsLayout];
                });
                
            }
        }];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    NSLog(@"imagePickerController：%@",info);
    [picker dismissViewControllerAnimated:YES completion:^{
            
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImageView *imageview = [[UIImageView alloc]init];
        [imageview setContentMode:UIViewContentModeCenter];
        [imageview setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
        imageview.layer.cornerRadius = 5;
        [imageview setBackgroundColor:[UIColor blackColor]];
        [scrollview addSubview:imageview];
        [self.view setNeedsLayout];
    });
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"imagePickerControllerDidCancel：取消选择");
    [picker dismissViewControllerAnimated:YES completion:^{
            
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    //--------------------下载图片到相册------------------------
//    PhotoAlbum *photo = [[PhotoAlbum alloc]init];
//    [photo downLoadMediaFromWeb:@"http://api.cocoachina.com/uploads/20160711/1468230232970410.jpg" error:^(NSError * _Nonnull error) {
//        if(!error){
//            [ToastUtil toastInshorttime:@"保存成功" view:self.view];
//
//        }
//    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show:) name:@"qq" object:nil];
}

-(void)show:(NSNotification*)show{
    NSLog(@"11111%@",show.userInfo);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
