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
    JMTabBarItem *item1 = [JMTabBarItem tabBarItemWithTitle:@"首页"
                                              controllClass:[FirstViewController class]
                                          selectedImageName:@"Tab_Main_Highlight"
                                        unSelectedImageName:@"Tab_Main_Normal"
                                                   selected:true];
    
    [tabArray addObject:item1];
    
    JMTabBarItem *item2 = [JMTabBarItem tabBarItemWithTitle:@"客服"
                                              controllClass:[SecondViewController class]
                                          selectedImageName:@"Tab_Assistant_Highlight"
                                        unSelectedImageName:@"Tab_Assistant_Normal"
                                                   selected:NO];
    
    [tabArray addObject:item2];
    
    JMTabBarItem *item3 = [JMTabBarItem tabBarItemWithTitle:@"我的"
                                              controllClass:[ThirdViewController class]
                                          selectedImageName:@"Tab_Mine_Highlight"
                                        unSelectedImageName:@"Tab_Mine_Normal"
                                                   selected:NO
                                          loginStateControl:true];
    
    [tabArray addObject:item3];
    
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
