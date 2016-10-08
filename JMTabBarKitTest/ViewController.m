//
//  ViewController.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITapGestureRecognizer *tap;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(close)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) close {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
