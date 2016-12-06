//
//  AppDelegate.m
//  JMTabBarKitTest
//
//  Created by James on 2016/12/4.
//  Copyright © 2016年 James. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "LoginViewController.h"

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
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - TabBar
- (void)setupJMTabBar {
    NSMutableArray *tabArray = [NSMutableArray array];
    JMTabBarItem *item1 = [JMTabBarItem tabBarItemWithTitle:@"主页"
                                              controllClass:[FirstViewController class]
                                          selectedImageName:@"Tab_Main_Selected"
                                        unSelectedImageName:@"Tab_Main_UnSelected"
                                                   selected:true];
    
    [tabArray addObject:item1];
    
    JMTabBarItem *item2 = [JMTabBarItem tabBarItemWithTitle:@"添加"
                                              controllClass:[SecondViewController class]
                                          selectedImageName:@"Tab_Center_Selected"
                                        unSelectedImageName:@"Tab_Center_UnSelected"
                                                   selected:NO];
    
    [tabArray addObject:item2];
    
    JMTabBarItem *item3 = [JMTabBarItem tabBarItemWithTitle:@"我的"
                                              controllClass:[ThirdViewController class]
                                          selectedImageName:@"Tab_Mine_Selected"
                                        unSelectedImageName:@"Tab_Mine_UnSelected"
                                                   selected:NO];
    
    [tabArray addObject:item3];
    
    NSDictionary *selectedStyleDic = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor colorWithRed:0 green:152.0/255.0 blue:0 alpha:1.0]};
    
    NSDictionary *unSelectedStyleDic = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor colorWithRed:74.0f/255.0f green:74.0f/255.0f blue:74.0f/255.0f alpha:1.0]};
    
    _tabBarVC = [[JMTabBarController alloc] initWithTabBarArray:tabArray
                                         selectedTextAttributes:selectedStyleDic
                                       unSelectedTextAttributes:unSelectedStyleDic];
    
    __weak JMTabBarController *weakTabBarVC = _tabBarVC;
    _tabBarVC.tabBarShouldSelectBlock = ^(UIViewController * viewController,NSInteger shouldSelectedIndex) {
        if (shouldSelectedIndex == 2) {
            LoginViewController *login = [[LoginViewController alloc] init];
            [weakTabBarVC presentViewController:login animated:YES completion:^{
                
            }];
            
            return NO;
        }
        
        return YES;
    };
    self.window.rootViewController = _tabBarVC;
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
    //    view.backgroundColor = [UIColor redColor];
    //    [tabBarVC.tabBar addSubview:view];
    UITabBarItem* tab = [[_tabBarVC.tabBar items] objectAtIndex:1];
    tab.badgeValue = @"99+";
}

@end
