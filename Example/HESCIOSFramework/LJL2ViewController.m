//
//  LJL2ViewController.m
//  HESCIOSFramework_Example
//
//  Created by 刘俊林 on 2021/10/8.
//  Copyright © 2021 napolun007@gmail.com. All rights reserved.
//

#import "LJL2ViewController.h"
#import "LJL3ViewController.h"

@interface LJL2ViewController (){
    NSString *pretitle;
}

@end

@implementation LJL2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 300, 30)];
    [label setText:@"什么鬼"];
    [label setTextColor:[UIColor blackColor]];
    label.layer.borderColor = [UIColor blackColor].CGColor;
    label.layer.borderWidth = 1;
    [label setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(tothird:)];
    [label addGestureRecognizer:tap];
    
    [self.view addSubview:label];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show:) name:@"qq" object:nil];
}

-(void)show:(NSNotification*)show{
    NSLog(@"22222%@",show.userInfo);
}

-(void)tothird:(UITapGestureRecognizer *)tap{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"什么什么什么" style:UIBarButtonItemStylePlain target:nil action:nil];
    //设置自定义的返回按钮
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"back"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back"]];
    
    LJL3ViewController *l3 = [[LJL3ViewController alloc]init];
    [self.navigationController pushViewController:l3 animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"12332t"];
    
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"来阿里" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(topre:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithCustomView:backButton];
//    UIButton *backButton1=[UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton1 setTitle:@"来阿里1" forState:UIControlStateNormal];
//    [backButton1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [backButton1 addTarget:self action:@selector(topre:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithCustomView:backButton1];
//    UIButton *backButton2=[UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton2 setTitle:@"来阿里2" forState:UIControlStateNormal];
//    [backButton2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [backButton2 addTarget:self action:@selector(topre:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithCustomView:backButton2];
//
//    UIButton *backButton3=[UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton3 setTitle:@"来阿里3" forState:UIControlStateNormal];
//    [backButton3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [backButton3 addTarget:self action:@selector(topre:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item4=[[UIBarButtonItem alloc]initWithCustomView:backButton3];
//
//    NSArray *items = @[item1,item2,item3,item4];
    
//    self.navigationItem.leftBarButtonItems = items;
    
    [self.navigationItem setLeftBarButtonItem:item1 animated:YES];
    [self.navigationItem setLeftItemsSupplementBackButton:YES];
  
   
}


-(void)topre:(id)topre{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    pretitle = self.navigationController.navigationBar.backItem.title;
    NSLog(@"backitem：%@",pretitle);
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (@available(iOS 13, *))
        [self.navigationController.navigationBar.backItem setTitle:pretitle];
    else
        [self.navigationController.navigationBar.topItem setTitle:pretitle];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
