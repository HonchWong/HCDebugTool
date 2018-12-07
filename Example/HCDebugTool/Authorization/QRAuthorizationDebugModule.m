//
//  QRAuthorizationDebugModule.m
//  QQReaderUI
//
//  Created by 黄鸿昌 on 2018/12/7.
//  Copyright © 2018年 _tencent_. All rights reserved.
//


#import "QRAuthorizationDebugModule.h"

typedef NS_OPTIONS(NSInteger, QRAuthorizationDebugModuleOptionViewTag) {
    QRAuthorizationDebugModuleOptionViewTag_ForbidQuickLogin = 1,    // 禁止快速登录
    QRCommonToolsDebugModuleOptionViewTag_KillLoginState = 2,        // 去除登录态
    QRCommonToolsDebugModuleOptionViewTag_LoginExpired = 3,          // 登录过期(仅QQ有效)
};

@implementation QRAuthorizationDebugModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - Super Class

- (NSString *)moduleTitle {
    return @"登陆授权模块";
}

#pragma mark - HCDebugToolCommonOptionViewProtocol

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case QRAuthorizationDebugModuleOptionViewTag_ForbidQuickLogin:
            NSLog(@"QRAuthorizationDebugModuleOptionViewTag_ForbidQuickLogin");
            break;
        case QRCommonToolsDebugModuleOptionViewTag_KillLoginState:
            NSLog(@"QRCommonToolsDebugModuleOptionViewTag_KillLoginState");
            break;
        case QRCommonToolsDebugModuleOptionViewTag_LoginExpired:
            NSLog(@"QRCommonToolsDebugModuleOptionViewTag_LoginExpired");
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
    return @[@{@"title": @"禁止快速登录",
               @"icon": @"",
               @"viewTag": @(QRAuthorizationDebugModuleOptionViewTag_ForbidQuickLogin)},
             @{@"title": @"去除登录态",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_KillLoginState)},
             @{@"title": @"登录过期(仅QQ有效)",
               @"icon": @"",
               @"viewTag": @(QRCommonToolsDebugModuleOptionViewTag_LoginExpired)}];
}

@end

