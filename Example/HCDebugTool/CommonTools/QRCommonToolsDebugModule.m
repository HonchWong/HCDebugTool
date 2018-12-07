//
//  QRCommonToolsDebugModule.m
//  QQReaderUI
//
//  Created by 黄鸿昌 on 2018/12/7.
//  Copyright © 2018年 _tencent_. All rights reserved.
//


#import "QRCommonToolsDebugModule.h"

typedef NS_OPTIONS(NSInteger, QRCommonToolsDebugModuleOptionViewTag) {
    QRCommonToolsDebugModuleOptionViewTag_Logger = 1,       // 日志调试
    QRCommonToolsDebugModuleOptionViewTag_AnalysisBar = 2,  // 统计实时日志
    QRCommonToolsDebugModuleOptionViewTag_FLEX = 3,         // FLEX
    QRCommonToolsDebugModuleOptionViewTag_Crash = 4,
    QRCommonToolsDebugModuleOptionViewTag_CrashLog = 5,
};

@interface QRCommonToolsDebugModule ()

@end

@implementation QRCommonToolsDebugModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - Super Class

- (NSString *)moduleTitle {
    return @"常用技术工具";
}

#pragma mark - HCDebugToolCommonOptionViewProtocol

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case QRCommonToolsDebugModuleOptionViewTag_Logger:
            NSLog(@"QRCommonToolsDebugModuleOptionViewTag_Logger");
            break;
        case QRCommonToolsDebugModuleOptionViewTag_AnalysisBar:
//            [[QRDDebugAnalysisManager sharedManager] showExplorer];
            break;
        case QRCommonToolsDebugModuleOptionViewTag_FLEX:
//            [[FLEXManager sharedManager] showExplorer];
            break;
        case QRCommonToolsDebugModuleOptionViewTag_Crash:
            NSLog(@"QRCommonToolsDebugModuleOptionViewTag_Crash");
            break;
        case QRCommonToolsDebugModuleOptionViewTag_CrashLog:
            NSLog(@"QRCommonToolsDebugModuleOptionViewTag_CrashLog");
            break;
    }
}

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
    return @[@{@"title": @"日志框架设置",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_Logger)},
             @{@"title": @"统计悬浮窗",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_AnalysisBar)},
             @{@"title": @"FLEX",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_FLEX)},
             @{@"title": @"Crash",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_Crash)},
             @{@"title": @"Crash 日志",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_CrashLog)}];
}

@end

