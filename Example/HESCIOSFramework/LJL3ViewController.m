//
//  LJL3ViewController.m
//  HESCIOSFramework_Example
//
//  Created by 刘俊林 on 2021/10/12.
//  Copyright © 2021 napolun007@gmail.com. All rights reserved.
//

#import "LJL3ViewController.h"
#import <HESCFramework.h>

static NSString *idstr = @"cell";
@interface LJL3ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}

@property(nonatomic,strong) UITableView *tableview;


@end

@implementation LJL3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, [DisplayUtil getNavigationBarHeight], [DisplayUtil getScreenWidth], [DisplayUtil getScreenHeight] - [DisplayUtil getNavigationBarHeight])];
    _tableview.rowHeight = 50;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [_tableview setBackgroundColor:[UIColor greenColor]];   
    
    [self.view addSubview:_tableview];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    //滚动到指定位置
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [_tableview scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:20 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    });
    [NSThread alloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableview dequeueReusableCellWithIdentifier:idstr];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idstr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"行号:%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.textLabel.text);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"qq" object:self userInfo:@{@"name":@"abc"}];
}

@end
