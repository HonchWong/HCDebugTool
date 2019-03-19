# HCDebugTool

[![CI Status](https://img.shields.io/travis/honchwong404@gmail.com/HCDebugTool.svg?style=flat)](https://travis-ci.org/honchwong404@gmail.com/HCDebugTool)
[![Version](https://img.shields.io/cocoapods/v/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)
[![License](https://img.shields.io/cocoapods/l/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)
[![Platform](https://img.shields.io/cocoapods/p/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)

## Example

clone 仓库，在 /HCDebugTool/Example文件夹下执行 `pod install` ，运行App 后点击电池栏位置3下弹出调试菜单，类似下面截图的效果

![demo](http://m.qpic.cn/psb?/V10JaO4w40EHz4/LsexZv6Mw.iXuq*JbQYLfwpO*z8s5be8fNsMCXLfoNU!/b/dFIBAAAAAAAA&bo=dwHZAgAAAAADB48!&rf=viewer_4)

## 工具特点

本工具有两个特点是易管理和易扩展，扩展一个类似红框圈住的Module（模块），只需要生成一个类，实现四个方法，扩展一个绿框内的item只需要修改至少一个方法。可以参考Example 工程里的 HCNetDebugModule类

## 使用

1. 创建个继承HCDebugToolCommonModule 的类，并注册module


```objc
+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]
                                             sortLevel:QRDebugModuleSortLevel_Net];
}
``` 

2. 实现 -moduleTitle 方法并返回Module 标题

```objc
- (NSString *)moduleTitle {
    return @"网络调试";
}
```

3. 重载父类方法，定义绿框内item的UI

```objc
- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"Mock网络数据",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCNetDebugOptionViewTag_Mock),
               },
             @{HCDebugCommonModuleOptionKeys.title: @"FLEX",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCNetDebugOptionViewTag_Proxy),
               },
             @{HCDebugCommonModuleOptionKeys.title: @"测试开关",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCNetDebugOptionViewTag_TestSwitch),
               HCDebugCommonModuleOptionKeys.hasSwich: @(YES),
               HCDebugCommonModuleOptionKeys.isSwichOn: @(YES),
               },];
}
```

4. 响应item的交互事件 

```objc
- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case HCNetDebugOptionViewTag_Mock:
            break;
        case HCNetDebugOptionViewTag_Proxy:
            break;
    }
}

- (void)optionSwitchDidChage:(HCDebugToolCommonOptionItemViewModel *)option
                      status:(BOOL)isOn {
    switch (option.viewTag) {
        case HCNetDebugOptionViewTag_TestSwitch:
            break;
    }
}
```

## 更多API

HCDebugToolCommonModule 还提供了导航控制器的API 供子类使用

```
- (void)hideMenuView;
- (void)hideMenuView:(void (^)(void))completion;

- (void)pushViewController:(UIViewController *)viewController;
- (void)presentViewController:(UIViewController *)viewController;
```

框架还提供debug Module 排序展示的能力，在使用下面接口的时候传入的sortLevel高则优先展示

```
- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(NSInteger)sortLevel;
```

## Requirements

## Installation

HCDebugTool is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HCDebugTool'
```

## Author

honchwong404@gmail.com, honchwong404@gmail.com

## License

HCDebugTool is available under the MIT license. See the LICENSE file for more info.
