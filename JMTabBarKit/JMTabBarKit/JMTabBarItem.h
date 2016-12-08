//
//  JMTabBarItem.h
//  JMTabBarKit
//
//  Created by james on 15/4/24.
//  Copyright (c) 2015年 james. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMTabBarItem : NSObject

@property (nonatomic,strong) NSString       *title;
@property (nonatomic,strong) Class          controllerClass;
@property (nonatomic,strong) NSString       *selectedImageName;
@property (nonatomic,strong) NSString       *unSelectedImageName;
@property (nonatomic,assign) BOOL           selected;               // 是否被选中显示

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
                           selected:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END
