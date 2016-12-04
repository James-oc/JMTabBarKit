//
//  FirstViewController.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/28.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title                = @"主页";

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame     = CGRectMake(50, 100, 100, 90);
    [btn setTitle:@"切换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)clickBtn {
    AppDelegate *_appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [_appDelegate.tabBarVC setTabBarSelectedIndex:1];
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
