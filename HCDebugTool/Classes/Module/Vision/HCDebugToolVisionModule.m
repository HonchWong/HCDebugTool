//
//  HCDebugToolVisionModule.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolVisionModule.h"
#import <UIKit/UIKit.h>
#import "HCDebugToolManager+Module.h"
#import "HCDebugToolCommonOptionView.h"

typedef NS_OPTIONS(NSInteger, HCDebugToolVisionOptionViewTag) {
    HCDebugToolVisionOptionViewTag_PointCheck = 1,
    HCDebugToolVisionOptionViewTag_ColorCheck = 2,
};

@implementation HCDebugToolVisionModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - HCDebugToolCommonOptionViewDelegate

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

#pragma mark - HCDebugToolModuleProtocol

- (NSString *)moduleTitle {
    return @"视觉工具";
}

#pragma mark - SuperClass

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"颜色检查颜色检查颜色检查",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCDebugToolVisionOptionViewTag_ColorCheck)},
             @{HCDebugCommonModuleOptionKeys.title: @"对齐检查",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCDebugToolVisionOptionViewTag_PointCheck),
               HCDebugCommonModuleOptionKeys.hasSwich: @(YES),
               HCDebugCommonModuleOptionKeys.isSwichOn: @(YES),
               }];
}

@end
