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
/** 登录状态控制（比如未登录跳转到登录）**/
@property (nonatomic,copy) JMTabBarLoginStateControl tabBarLoginStateControl;//
/** tabBar数组,存放每个JMTabBarItem **/
@property (nonatomic,strong) NSArray                   *tabBarArray;
/** 选中时候的tabBar文本样式 **/
@property (nonatomic,strong) NSDictionary              *tabBarSelectedTextAttributesDic;
/** 未选中时候的tabBar文本样式 **/
@property (nonatomic,strong) NSDictionary              *tabBarUnSelectedTextAttributesDic;

/**
 *  @brief 实例化
 *
 *  @param tabBarArray                      TabBar Item项数组
 *  @param selectedTextAttributesArray      选中样式
 *  @param unSelectedTextAttributesArray    未选中样式
 *
 *  @return JMTabBarController
 */
- (instancetype)initWithTabBarArray:(NSArray *)tabBarArray
             selectedTextAttributes:(NSDictionary *)selectedTextAttributesArray
           unSelectedTextAttributes:(NSDictionary *)unSelectedTextAttributesArray;

/**
 *  @brief 设置选中TabBar Item项
 *
 *  @param tabBarSelectedIndex Item项下标
 *
 *  @return UIViewController
 */
- (UIViewController *)setTabBarSelectedIndex:(NSInteger)tabBarSelectedIndex;

@end
