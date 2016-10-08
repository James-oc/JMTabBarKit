//
//  JMTabBarController.h
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMTabBarItem.h"

typedef void (^JMTabBarViewWillAppear)      (void);
typedef void (^JMTabBarViewWillDisappear)   (void);
typedef void (^JMTabBarViewDidAppear)       (void);
typedef void (^JMTabBarViewDidDisappear)    (void);

typedef BOOL (^JMTabBarLoginStateControl) (UIViewController *viewController, NSInteger selectedIndex);

@interface JMTabBarController : UITabBarController<UITabBarControllerDelegate>

@property (nonatomic,copy) JMTabBarViewWillAppear    tabBarViewWillAppear;
@property (nonatomic,copy) JMTabBarViewWillDisappear tabBarViewWillDisappear;
@property (nonatomic,copy) JMTabBarViewDidAppear     tabBarViewDidAppear;
@property (nonatomic,copy) JMTabBarViewDidDisappear  tabBarViewDidDisappear;

@property (nonatomic,copy) JMTabBarLoginStateControl tabBarLoginStateControl;// 登录状态控制（比如未登录跳转到登录）

@property (nonatomic,strong) NSArray                   *tabBarArray;                      // tabBar数组,存放每个JMTabBarItem
@property (nonatomic,strong) NSDictionary              *tabBarSelectedTextAttributesDic;  // 选中时候的tabBar文本样式
@property (nonatomic,strong) NSDictionary              *tabBarUnSelectedTextAttributesDic;// 未选中时候的tabBar文本样式
@property (nonatomic,strong) UIButton                  *tabBarSpecialBtn;                 // 特殊的tabBar按钮

- (instancetype)initWithTabBarArray:(NSArray *)tabBarArray
             selectedTextAttributes:(NSDictionary *)selectedTextAttributesArray
           unSelectedTextAttributes:(NSDictionary *)unSelectedTextAttributesArray;

- (UIViewController *)setTabBarSelectedIndex:(NSInteger)tabBarSelectedIndex;

@end
