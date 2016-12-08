//
//  JMTabBarController.m
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "JMTabBarController.h"

#define JM_TabBar_IOS7_OR_LATER                ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface JMTabBarController ()
{
    NSUInteger     _tagOrigin;
}

/** tabBar数组,存放每个JMTabBarItem **/
@property (nonatomic,strong, readwrite) NSArray       *tabBarArray;
/** 选中时候的tabBar文本样式 **/
@property (nonatomic,strong, readwrite) NSDictionary  *tabBarSelectedTextAttributesDic;
/** 未选中时候的tabBar文本样式 **/
@property (nonatomic,strong, readwrite) NSDictionary  *tabBarUnSelectedTextAttributesDic;

@end

@implementation JMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_tabBarViewWillAppear != nil) {
        _tabBarViewWillAppear();
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (_tabBarViewWillDisappear != nil) {
        _tabBarViewWillDisappear();
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_tabBarViewDidAppear != nil) {
        _tabBarViewDidAppear();
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    if (_tabBarViewDidDisappear != nil) {
        _tabBarViewDidDisappear();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
           unSelectedTextAttributes:(NSDictionary *)unSelectedTextAttributesArray {
    self = [super init];
    
    if (self) {
        _tagOrigin                             = 1000;
        self.tabBarArray                       = tabBarArray;
        self.tabBarSelectedTextAttributesDic   = selectedTextAttributesArray;
        self.tabBarUnSelectedTextAttributesDic = unSelectedTextAttributesArray;
    }
    
    return self;
}

- (void)setupTabBarController {
    if (_tabBarArray != nil && _tabBarArray.count != 0) {
        NSUInteger count = _tabBarArray.count;
        NSMutableArray *viewControllerArray = [NSMutableArray array];
        
        for (int i = 0; i < count; i++) {
            if ([_tabBarArray[i] isKindOfClass:[JMTabBarItem class]]) {
                JMTabBarItem *item = _tabBarArray[i];
                
                UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:[[item.controllerClass alloc] init]];
                navVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:item.title
                                                                 image:[UIImage imageNamed:item.selectedImageName]
                                                                   tag:_tagOrigin + i];
                
                navVC.tabBarItem.image = [UIImage imageNamed:item.unSelectedImageName];
                navVC.tabBarItem.selectedImage = [UIImage imageNamed:item.selectedImageName];
                
                if (JM_TabBar_IOS7_OR_LATER) {
                    navVC.tabBarItem.image = [navVC.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                    navVC.tabBarItem.selectedImage = [navVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                }else{
                    [navVC.tabBarItem setFinishedSelectedImage:navVC.tabBarItem.selectedImage
                                   withFinishedUnselectedImage:navVC.tabBarItem.image];
                }
                
                if (item.selected) {
                    [navVC.tabBarItem setTitleTextAttributes:self.tabBarSelectedTextAttributesDic forState:UIControlStateNormal];
                    self.selectedIndex = i;
                }else {
                    [navVC.tabBarItem setTitleTextAttributes:self.tabBarUnSelectedTextAttributesDic forState:UIControlStateNormal];
                }
                
                [viewControllerArray addObject:navVC];
            }
        }
        
        self.viewControllers = viewControllerArray;
        self.delegate        = self;
    }
}

/**
 *  @brief 设置选中TabBar Item项
 *
 *  @param tabBarSelectedIndex Item项下标
 *
 *  @return UIViewController
 */
- (UIViewController *)setTabBarSelectedIndex:(NSInteger)tabBarSelectedIndex {
    UIViewController *selectedVC = nil;
    
    if (tabBarSelectedIndex >= 0 && tabBarSelectedIndex < _tabBarArray.count) {
        selectedVC = self.viewControllers[tabBarSelectedIndex];
        if ([self tabBarController:self shouldSelectViewController:selectedVC]) {
            self.selectedIndex = tabBarSelectedIndex;
        }
    }
    
    return selectedVC;
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    BOOL shouldSelected = YES;
    
    if (_tabBarShouldSelectBlock) {
        NSUInteger  index   = [self.viewControllers indexOfObject:viewController];
        shouldSelected = _tabBarShouldSelectBlock(viewController, index);
    }
    
    if (shouldSelected) {
        [viewController.tabBarItem setTitleTextAttributes:self.tabBarSelectedTextAttributesDic forState:UIControlStateNormal];
        
        for (UIViewController *vc in tabBarController.viewControllers) {
            if (vc != viewController) {
                [vc.tabBarItem setTitleTextAttributes:self.tabBarUnSelectedTextAttributesDic forState:UIControlStateNormal];
            }
        }
    }
    
    return shouldSelected;
}

@end
