//
//  JMTabBarItem.h
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMTabBarItem : NSObject

@property (nonatomic,strong) NSString       *title;
@property (nonatomic,strong) Class          controllerClass;
@property (nonatomic,strong) NSString       *selectedImageName;
@property (nonatomic,strong) NSString       *unSelectedImageName;
@property (nonatomic,assign) BOOL           selected;               // 是否被选中显示
@property (nonatomic,assign) BOOL           loginStateControl;      // 是否需要登录状态控制

+ (instancetype)tabBarItemWithTitle:(NSString *)title
                      controllClass:(Class)controllerClass
                  selectedImageName:(NSString *)selectedImageName
                unSelectedImageName:(NSString *)unSelectedImageName
                           selected:(BOOL)selected;

@end
