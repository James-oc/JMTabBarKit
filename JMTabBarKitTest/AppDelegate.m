//
//  AppDelegate.m
//  JMTabBarKitTest
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupJMTabBar];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Test
- (void)setupJMTabBar {
    NSMutableArray *tabArray = [NSMutableArray array];
    JMTabBarItem *item1 = [[JMTabBarItem alloc] init];
    item1.title = @"首页";
    item1.controllerClass = [FirstViewController class];
    item1.selectedImageName = @"Tab_Main_Highlight";
    item1.unSelectedImageName = @"Tab_Main_Normal";
    item1.selected = YES; // 初始选中状态
    
    [tabArray addObject:item1];
    
    JMTabBarItem *item2 = [[JMTabBarItem alloc] init];
    item2.title = @"客服";
    item2.controllerClass = [SecondViewController class];
    item2.selectedImageName = @"Tab_Assistant_Highlight";
    item2.unSelectedImageName = @"Tab_Assistant_Normal";
    item2.selected = NO;
    
    [tabArray addObject:item2];
    
    JMTabBarItem *item3 = [[JMTabBarItem alloc] init];
    item3.title = @"日记";
    item3.controllerClass = [ThirdViewController class];
    item3.selectedImageName = @"Tab_Diary_Highlight";
    item3.unSelectedImageName = @"Tab_Diary_Normal";
    item3.selected = NO;
    
    [tabArray addObject:item3];
    
    JMTabBarItem *item4 = [[JMTabBarItem alloc] init];
    item4.title = @"我的";
    item4.controllerClass = [ThirdViewController class];
    item4.selectedImageName = @"Tab_Mine_Highlight";
    item4.unSelectedImageName = @"Tab_Mine_Normal";
    item4.selected = NO;
    item4.loginStateControl = YES;
    
    [tabArray addObject:item4];
    
    NSDictionary *selectedStyleDic = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor colorWithRed:255.0/255.0 green:73.0/255.0 blue:0.0/255.0 alpha:1.0]};
    
    NSDictionary *unSelectedStyleDic = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor colorWithRed:74.0f/255.0f green:74.0f/255.0f blue:74.0f/255.0f alpha:1.0]};
    
    // 第一种创建方式
    _tabBarVC = [[JMTabBarController alloc] initWithTabBarArray:tabArray
                                                    selectedTextAttributes:selectedStyleDic
                                                  unSelectedTextAttributes:unSelectedStyleDic];
    
    __weak JMTabBarController *weakTabBarVC = _tabBarVC;
    _tabBarVC.tabBarLoginStateControl = ^(UIViewController* viewController,NSInteger index) {
        ViewController *login = [[ViewController alloc] init];
        [weakTabBarVC presentViewController:login animated:YES completion:^{
            
        }];
        
        return NO;
    };
    self.window.rootViewController = _tabBarVC;
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
//    view.backgroundColor = [UIColor redColor];
//    [tabBarVC.tabBar addSubview:view];
    UITabBarItem* tab = [[_tabBarVC.tabBar items] objectAtIndex:1];
    tab.badgeValue = @"99+";
}
@end
