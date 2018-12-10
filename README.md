# HCDebugTool

[![CI Status](https://img.shields.io/travis/honchwong404@gmail.com/HCDebugTool.svg?style=flat)](https://travis-ci.org/honchwong404@gmail.com/HCDebugTool)
[![Version](https://img.shields.io/cocoapods/v/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)
[![License](https://img.shields.io/cocoapods/l/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)
[![Platform](https://img.shields.io/cocoapods/p/HCDebugTool.svg?style=flat)](https://cocoapods.org/pods/HCDebugTool)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![demo](http://m.qpic.cn/psb?/V10JaO4w40EHz4/LsexZv6Mw.iXuq*JbQYLfwpO*z8s5be8fNsMCXLfoNU!/b/dFIBAAAAAAAA&bo=dwHZAgAAAAADB48!&rf=viewer_4)

### 工具特点

本工具的特点是易扩展，扩展一个类似红框圈住的Module（模块），只需要实现三个方法，可以参考代码里的 HCDebugToolVisionModule.m 

1. 创建个继承HCDebugToolCommonModule 的类，并注册module


```
[[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
``` 

2. 实现 -moduleTitle 方法并返回Module 标题

```
- (NSString *)moduleTitle {
    return @"视觉工具";
}
```

3. 重载父类方法，定义绿框内item的UI

```
- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"颜色检查颜色检查颜色检查",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCDebugToolVisionOptionViewTag_ColorCheck)},
             @{HCDebugCommonModuleOptionKeys.title: @"对齐检查",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCDebugToolVisionOptionViewTag_PointCheck),
               HCDebugCommonModuleOptionKeys.hasSwich: @(YES),
               HCDebugCommonModuleOptionKeys.isSwichOn: @(YES),
               }];
}
```

4. 响应item的交互事件 

```
- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case HCDebugToolVisionOptionViewTag_PointCheck:
            NSLog(@"HCDebugToolVisionOptionViewTag_PointCheck");
            break;
        case HCDebugToolVisionOptionViewTag_ColorCheck:
            NSLog(@"HCDebugToolVisionOptionViewTag_ColorCheck");
            break;
    }
}

- (void)optionSwitchDidChage:(HCDebugToolCommonOptionItemViewModel *)option
                      status:(BOOL)isOn {
    switch (option.viewTag) {
        case HCDebugToolVisionOptionViewTag_PointCheck:
            NSLog(@"HCDebugToolVisionOptionViewTag_PointCheck switch");
            break;
        case HCDebugToolVisionOptionViewTag_ColorCheck:
            NSLog(@"HCDebugToolVisionOptionViewTag_ColorCheck switch");
            break;
    }
}
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
