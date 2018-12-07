//
//  QRCommonBusinessDebugModule.m
//  QQReaderUI
//
//  Created by 黄鸿昌 on 2018/12/7.
//  Copyright © 2018年 _tencent_. All rights reserved.
//


#import "QRCommonBusinessDebugModule.h"

typedef NS_OPTIONS(NSInteger, QRCommonBusinessDebugModelOptionViewTag) {
    QRCommonBusinessDebugModelOptionViewTag_ForceGuideView = 1,         // 强制显示引导页
    QRCommonBusinessDebugModelOptionViewTag_ServerURLsEditor = 2,       // 服务器地址编辑器
    QRCommonBusinessDebugModelOptionViewTag_ForceBookcityActivity = 3,  // 强制显示书城弹窗
    QRCommonBusinessDebugModelOptionViewTag_NewUserBonus = 4,           // 新手礼包调试
    QRCommonBusinessDebugModelOptionViewTag_Theme = 5,                  // 皮肤调试
    QRCommonBusinessDebugModelOptionViewTag_Live = 6,                   // 加入直播
    QRCommonBusinessDebugModelOptionViewTag_FontStyle = 7,              // 字体样式
    QRCommonBusinessDebugModelOptionViewTag_Web = 8,                    // 进入网页
    QRCommonBusinessDebugModelOptionViewTag_OpenID = 9,                 // 获取OpenID
    QRCommonBusinessDebugModelOptionViewTag_ForbidDowngrade = 10,       // 禁止降级
    QRCommonBusinessDebugModelOptionViewTag_RNBundleInfo = 11,          // ReactNative Bundles信息
    QRCommonBusinessDebugModelOptionViewTag_AudioTime = 12,             // 听书时长
};

@implementation QRCommonBusinessDebugModule

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - Super Class

- (NSString *)moduleTitle {
    return @"未分类业务逻辑";
}

#pragma mark - HCDebugToolCommonOptionViewProtocol

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case QRCommonBusinessDebugModelOptionViewTag_ForceGuideView:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_ForceGuideView");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_ServerURLsEditor:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_ServerURLsEditor");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_ForceBookcityActivity:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_ForceBookcityActivity");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_NewUserBonus:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_NewUserBonus");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_Theme:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_Theme");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_OpenID:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_OpenID");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_FontStyle:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_FontStyle");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_Web:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_Web");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_Live:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_Live");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_ForbidDowngrade:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_ForbidDowngrade");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_RNBundleInfo:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_RNBundleInfo");
            break;
        case QRCommonBusinessDebugModelOptionViewTag_AudioTime:
            NSLog(@"QRCommonBusinessDebugModelOptionViewTag_AudioTime");
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
    return @[@{@"title": @"强制显示引导页",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_ForceGuideView)},
             @{@"title": @"服务器地址编辑器",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_ServerURLsEditor)},
             @{@"title": @"强制显示书城弹窗",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_ForceBookcityActivity)},
             @{@"title": @"新手礼包调试",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_NewUserBonus)},
             @{@"title": @"皮肤调试",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_Theme)},
             @{@"title": @"加入直播",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_Live)},
             @{@"title": @"字体样式",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_FontStyle)},
             @{@"title": @"进入网页",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_Web)},
             @{@"title": @"获取OpenID",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_OpenID)},
             @{@"title": @"禁止降级",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_ForbidDowngrade)},
             @{@"title": @"RN Bundles信息",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_RNBundleInfo)},
             @{@"title": @"听书时长",
               @"icon": @"",
               @"viewTag": @(QRCommonBusinessDebugModelOptionViewTag_AudioTime)},];
}

@end

