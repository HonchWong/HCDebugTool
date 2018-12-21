//
//  HCYogaKitDebugModule.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/20.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import "HCYogaKitDebugModule.h"
#import "HCDebugModuleSortLevel.h"
//#import <HCDebugTool/HCDebugTool.h>
#import "HCFlexBoxLayoutDemoViewController.h"

typedef NS_OPTIONS(NSInteger, HCYogaKitOptionViewTag) {
    HCYogaKitOptionViewTag_Frame,
    HCYogaKitOptionViewTag_Masonry,
    HCYogaKitOptionViewTag_YogaKit,
    HCYogaKitOptionViewTag_FlexBoxLayout,
};

@implementation HCYogaKitDebugModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - HCDebugToolCommonOptionViewDelegate

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case HCYogaKitOptionViewTag_Frame:
            NSLog(@"HCYogaKitOptionViewTag_Frame");
            break;
        case HCYogaKitOptionViewTag_Masonry:
            NSLog(@"HCYogaKitOptionViewTag_AutoLayout");
            break;
        case HCYogaKitOptionViewTag_YogaKit:
            NSLog(@"HCYogaKitOptionViewTag_YogaKit");
            break;
        case HCYogaKitOptionViewTag_FlexBoxLayout:
        {
            HCFlexBoxLayoutDemoViewController *demogVC =
            [[HCFlexBoxLayoutDemoViewController alloc] init];
            [[HCDebugToolManager sharedManager] pushViewController:demogVC];
        }
            NSLog(@"HCYogaKitOptionViewTag_FLexBoxLayout");
            break;
    }
}

#pragma mark - HCDebugToolModuleProtocol

- (NSString *)moduleTitle {
    return @"YogaKit";
}

#pragma mark - SuperClass

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{HCDebugCommonModuleOptionKeys.title: @"Frame",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCYogaKitOptionViewTag_Frame)},
             @{HCDebugCommonModuleOptionKeys.title: @"AutoLayout",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCYogaKitOptionViewTag_Masonry)},
             @{HCDebugCommonModuleOptionKeys.title: @"YogaKit",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCYogaKitOptionViewTag_YogaKit)},
             @{HCDebugCommonModuleOptionKeys.title: @"FlexBoxLayout",
               HCDebugCommonModuleOptionKeys.viewTag: @(HCYogaKitOptionViewTag_FlexBoxLayout)}];
}

@end
