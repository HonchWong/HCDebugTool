//
//  HCDebugToolVisionModule.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolVisionModule.h"
#import <UIKit/UIKit.h>
#import "HCDebugToolManager.h"
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

- (HCDebugToolCommonOptionViewModel *)optionViewModel {
    NSArray <NSDictionary *>* optionDicts = [self optionDicts];
    if (!optionDicts.count) {
        return nil;
    }
    
    NSMutableArray <HCDebugToolCommonOptionItemViewModel *>* tempArray = [NSMutableArray array];
    for (NSDictionary *optionItem in optionDicts) {
        HCDebugToolCommonOptionItemViewModel *
        optionItemViewModel = [[HCDebugToolCommonOptionItemViewModel alloc] init];
        optionItemViewModel.title = [optionItem objectForKey:@"title"];
        optionItemViewModel.icon = [optionItem objectForKey:@"icon"];
        optionItemViewModel.viewTag = [[optionItem objectForKey:@"viewTag"] integerValue];
        optionItemViewModel.hasSwich = YES;
        optionItemViewModel.isSwichOn = YES;
        [tempArray addObject:optionItemViewModel];
    }
    HCDebugToolCommonOptionViewModel *optionViewModel = [[HCDebugToolCommonOptionViewModel alloc] init];
    optionViewModel.items = tempArray;
    return optionViewModel;
}

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{@"title": @"颜色检查颜色检查颜色检查",
               @"icon": @"",
               @"viewTag": @(HCDebugToolVisionOptionViewTag_ColorCheck)},
             @{@"title": @"对齐检查",
               @"icon": @"",
               @"viewTag": @(HCDebugToolVisionOptionViewTag_PointCheck)}];
}

@end
