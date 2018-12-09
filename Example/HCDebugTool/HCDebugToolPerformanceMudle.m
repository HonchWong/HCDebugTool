//
//  HCDebugToolPerformanceMudle.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/7.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import "HCDebugToolPerformanceMudle.h"

typedef NS_OPTIONS(NSInteger, HCDebugToolVisionOptionViewTag) {
    HCDebugToolPerformanceOptionViewTag_CPU = 1,
    HCDebugToolPerformanceOptionViewTag_FPS = 2,
    HCDebugToolPerformanceOptionViewTag_Memory = 3,
};

@implementation HCDebugToolPerformanceMudle

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - HCDebugToolCommonOptionViewDelegate

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case HCDebugToolPerformanceOptionViewTag_CPU:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_CPU");
            break;
        case HCDebugToolPerformanceOptionViewTag_FPS:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_FPS");
            break;
        case HCDebugToolPerformanceOptionViewTag_Memory:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_Memory");
            break;
    }
}

- (void)optionSwitchDidChage:(HCDebugToolCommonOptionItemViewModel *)option
                      status:(BOOL)isOn {
    switch (option.viewTag) {
        case HCDebugToolPerformanceOptionViewTag_CPU:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_CPU switch");
            break;
        case HCDebugToolPerformanceOptionViewTag_FPS:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_FPS switch");
            break;
        case HCDebugToolPerformanceOptionViewTag_Memory:
            NSLog(@"HCDebugToolPerformanceOptionViewTag_Memory switch");
            break;
    }
}

#pragma mark - HCDebugToolModuleProtocol

- (NSString *)moduleTitle {
    return @"性能检测";
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
        [tempArray addObject:optionItemViewModel];
    }
    HCDebugToolCommonOptionViewModel *optionViewModel = [[HCDebugToolCommonOptionViewModel alloc] init];
    optionViewModel.items = tempArray;
    return optionViewModel;
}

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{@"title": @"CPUCPUCPUCPUCPUCPUCPU",
               @"icon": @"",
               @"viewTag": @(HCDebugToolPerformanceOptionViewTag_CPU)},
             @{@"title": @"FPS",
               @"icon": @"",
               @"viewTag": @(HCDebugToolPerformanceOptionViewTag_FPS)},
             @{@"title": @"Memory",
               @"icon": @"",
               @"viewTag": @(HCDebugToolPerformanceOptionViewTag_Memory)}];
}
@end
