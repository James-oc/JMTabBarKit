//
//  JMTabBarController.h
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMTabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^JMTabBarViewWillAppear)      (void);
typedef void (^JMTabBarViewWillDisappear)   (void);
typedef void (^JMTabBarViewDidAppear)       (void);
typedef void (^JMTabBarViewDidDisappear)    (void);

typedef BOOL (^JMTabBarShouldSelectBlock) (UIViewController *viewController, NSInteger shouldSelectedIndex);

@interface JMTabBarController : UITabBarController<UITabBarControllerDelegate>

@property (nonatomic,copy) JMTabBarViewWillAppear    tabBarViewWillAppear;
@property (nonatomic,copy) JMTabBarViewWillDisappear tabBarViewWillDisappear;
@property (nonatomic,copy) JMTabBarViewDidAppear     tabBarViewDidAppear;
@property (nonatomic,copy) JMTabBarViewDidDisappear  tabBarViewDidDisappear;
/** 控制TabBarItem能不能选中(可用于如登录控制等) **/
@property (nonatomic,copy) JMTabBarShouldSelectBlock tabBarShouldSelectBlock;
/** tabBar数组,存放每个JMTabBarItem **/
@property (nonatomic,strong, readonly) NSArray       *tabBarArray;
/** 选中时候的tabBar文本样式 **/
@property (nonatomic,strong, readonly) NSDictionary  *tabBarSelectedTextAttributesDic;
/** 未选中时候的tabBar文本样式 **/
@property (nonatomic,strong, readonly) NSDictionary  *tabBarUnSelectedTextAttributesDic;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

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

NS_ASSUME_NONNULL_END
