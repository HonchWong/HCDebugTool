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
#import "DoraemonViewAlignManager.h"
#import "DoraemonViewCheckManager.h"
#import "HCUIDefine.h"
#import "HCBugCommitViewController.h"

typedef NS_OPTIONS(NSInteger, HCDebugToolVisionOptionViewTag) {
    HCVisionModule_ColorPick = 1,
    HCVisionModule_CheckView = 2,
    HCVisionModule_Align = 3,
};

@interface HCVisionModule ()

@property (nonatomic, strong) HCBugCommitViewController *bugCommitVC;

@end

@implementation HCVisionModule

#pragma mark - Private

+ (void)load {
    HCVisionModule *module = [[self alloc] init];
    [[HCDebugToolManager sharedManager] registerModule:module
                                             sortLevel:QRDebugModuleSortLevel_Vision];
    [module setupBugCommitObserver];
}

- (void)setupBugCommitObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(commitBug)
                                                 name:BugCommitNotification
                                               object:nil];
}

- (void)commitBug {
    if (_bugCommitVC.navigationController) {
        return;
    }
    
    if (!_bugCommitVC) {
        _bugCommitVC = [[HCBugCommitViewController alloc] init];
    }
    
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:_bugCommitVC];
    
    [self presentViewController:naviVC];
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
            [[DoraemonViewCheckManager shareInstance] show];
            break;
        case HCVisionModule_Align:
            [[DoraemonViewAlignManager shareInstance] show];
            break;
    }
    [self hideMenuView];
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
