//
//  HCVisionModule.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/6.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCVisionModule.h"
#import "HCDebugModuleSortLevel.h"
#import "DoraemonColorPickInfoWindow.h"
#import "DoraemonColorPickWindow.h"

typedef NS_OPTIONS(NSInteger, HCDebugToolVisionOptionViewTag) {
    HCVisionModule_ColorPick = 1,
    HCVisionModule_CheckView = 2,
    HCVisionModule_Align = 3,
};

@implementation HCVisionModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]
                                             sortLevel:QRDebugModuleSortLevel_Vision];
}

#pragma mark - HCDebugToolCommonOptionViewDelegate

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case HCVisionModule_ColorPick:
            [[DoraemonColorPickWindow shareInstance] show];
            [[DoraemonColorPickInfoWindow shareInstance] show];
            break;
        case HCVisionModule_CheckView:
            break;
        case HCVisionModule_Align:
            break;
    }
    [[HCDebugToolManager sharedManager] hideMenuView];
}

#pragma mark - HCDebugToolModuleProtocol

- (NSString *)moduleTitle {
    return @"视觉工具";
}

#pragma mark - SuperClass

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"颜色吸管",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCVisionModule_ColorPick)},
             @{HCDebugCommonModuleOptionKeys.title: @"组件检查",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCVisionModule_CheckView)},
             @{HCDebugCommonModuleOptionKeys.title: @"对齐标尺",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCVisionModule_Align)}];
}

@end
