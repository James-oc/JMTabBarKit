# JMTabBarKit
### OC版自定义TabBar
---

## 效果
![Alt Text](https://github.com/xiaobs/JMShareSource/raw/master/screenshots/OC/JMTabBarKit/JMTabBarKit.gif)

## 安装
1. 将工程项目中的JMTabBarKit文件夹拉入自己的工程项目里面。
2. ```#import <JMTabBarKit/JMTabBarKit.h>```并开始代码编写。

## 通用SDK生成
1. 下载工程项目，打开JMTabBarKitTest.xcodeproj文件进入工程
2. 切换Scheme到JMTabBarKitAggregate，快捷键Command + B生成通用SDK
3. 将生成的.a文件和include文件夹拉入自己的工程项目里面
4. ```#import <JMTabBarKit/JMTabBarKit.h>```并开始代码编写。

## 用CocoaPods安装
CocoaPods是OSX和iOS下的一个第三类库管理工具,如果你还未安装请先查看[**CocoaPods安装和使用教程**](http://code4app.com/article/cocoapods-install-usage)

## Podfile
```OC
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '6.0'

pod 'JMTabBarKit', '~> 1.0.1'
```
执行命令
```OC
$ pod install
```

## 作者
James.xiao
