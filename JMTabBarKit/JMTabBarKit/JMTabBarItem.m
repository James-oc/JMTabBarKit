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
        _loginStateControl   = false;
    }
    
    return self;
}

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
