//
//  JMTabBarController.m
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "JMTabBarController.h"

#define JM_TabBar_IOS7_OR_LATER                ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define JM_TabBar_LoginStateControl_Dic_Index  @"Index"
#define JM_TabBar_LoginStateControl_Dic_Obj    @"Obj"

@interface JMTabBarController ()
{
    NSUInteger     _tagOrigin;
    NSMutableArray *_loginStateControlArray;
}
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
    if (_loginStateControlArray == nil) {
        _loginStateControlArray = [NSMutableArray array];
    }else {
        [_loginStateControlArray removeAllObjects];
    }
    
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
                
                if (item.loginStateControl) {
                    // 需要登录状态控制
                    [_loginStateControlArray addObject:@{
                                                         JM_TabBar_LoginStateControl_Dic_Index:@(i),
                                                         JM_TabBar_LoginStateControl_Dic_Obj:navVC,
                                                         }];
                }
                
                [viewControllerArray addObject:navVC];
            }
        }
        
        self.viewControllers = viewControllerArray;
        self.delegate        = self;
    }
}

- (UIViewController *)setTabBarSelectedIndex:(NSInteger)tabBarSelectedIndex {
    UIViewController *selectedVC = nil;
    
    if (tabBarSelectedIndex >= 0 && tabBarSelectedIndex < _tabBarArray.count) {
        self.selectedIndex = tabBarSelectedIndex;
        
        selectedVC = self.viewControllers[tabBarSelectedIndex];
        [self tabBarController:self shouldSelectViewController:selectedVC];
    }
    
    return selectedVC;
}

#pragma mark - properties set
- (void)setTabBarArray:(NSArray *)tabBarArray {
    _tabBarArray = tabBarArray;
    [self setupTabBarController];
}

- (void)setTabBarSelectedTextAttributesDic:(NSDictionary *)tabBarSelectedTextAttributesDic {
    _tabBarSelectedTextAttributesDic = tabBarSelectedTextAttributesDic;
    [self setupTabBarController];
}

- (void)setTabBarUnSelectedTextAttributesDic:(NSDictionary *)tabBarUnSelectedTextAttributesDic {
    _tabBarUnSelectedTextAttributesDic = tabBarUnSelectedTextAttributesDic;
    [self setupTabBarController];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    BOOL shouldSelected = YES;
    
    if (_loginStateControlArray != nil && _loginStateControlArray.count != 0) {
        for (int i = 0; i < _loginStateControlArray.count; i++) {
            NSDictionary *dict = _loginStateControlArray[i];
            
            if (dict[JM_TabBar_LoginStateControl_Dic_Obj] == viewController) {
                if (_tabBarLoginStateControl != nil) {
                    shouldSelected = _tabBarLoginStateControl(dict[JM_TabBar_LoginStateControl_Dic_Obj], [dict[JM_TabBar_LoginStateControl_Dic_Index] integerValue]);
                }
            }
        }
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
