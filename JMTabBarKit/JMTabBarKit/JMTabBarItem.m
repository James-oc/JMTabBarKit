//
//  JMTabBarItem.m
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import "JMTabBarItem.h"

@implementation JMTabBarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title               = @"";
        _controllerClass     = nil;
        _selectedImageName   = @"";
        _unSelectedImageName = @"";
        _selected            = false;
    }
    
    return self;
}

/**
 *  @brief TabBarItem
 *
 *  @param title                            标题
 *  @param controllerClass                  类
 *  @param selectedImageName                选中状态显示图片
 *  @param unSelectedImageName              未选中状态显示图片
 *  @param selected                         是否选中
 *
 *  @return JMTabBarController
 */
+ (instancetype)tabBarItemWithTitle:(NSString *)title
                      controllClass:(Class)controllerClass
                  selectedImageName:(NSString *)selectedImageName
                unSelectedImageName:(NSString *)unSelectedImageName
                           selected:(BOOL)selected {
    JMTabBarItem *item       = [[JMTabBarItem alloc] init];
    item.title               = title;
    item.controllerClass     = controllerClass;
    item.selectedImageName   = selectedImageName;
    item.unSelectedImageName = unSelectedImageName;
    item.selected            = selected;
    
    return item;
}

@end
