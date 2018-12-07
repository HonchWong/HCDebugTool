//
//  QRBookDebugModel.m
//  QQReaderUI
//
//  Created by 黄鸿昌 on 2018/12/7.
//  Copyright © 2018年 _tencent_. All rights reserved.
//


typedef NS_OPTIONS(NSInteger, QRBookDebugModelOptionViewTag) {
    QRBookDebugModelOptionViewTag_HKEngine = 1,         // 导入书使用精排引擎
    QRBookDebugModelOptionViewTag_ShelfMaxCount = 2,    // 最大书籍限制
    QRBookDebugModelOptionViewTag_AddBook = 3,          // 添加书籍
    QRBookDebugModelOptionViewTag_DefaultBook = 4,      // 导出内置书调试
};

#import "QRBookDebugModel.h"

@implementation QRBookDebugModel

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - Super Class

- (NSString *)moduleTitle {
    return @"书籍相关模块";
}

#pragma mark - HCDebugToolCommonOptionViewProtocol

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option
                  atIndex:(NSInteger)index {
    switch (option.viewTag) {
        case QRBookDebugModelOptionViewTag_HKEngine:
            NSLog(@"QRBookDebugModelOptionViewTag_HKEngine");
            break;
        case QRBookDebugModelOptionViewTag_ShelfMaxCount:
            NSLog(@"QRBookDebugModelOptionViewTag_ShelfMaxCount");
            break;
        case QRBookDebugModelOptionViewTag_AddBook:
            NSLog(@"QRBookDebugModelOptionViewTag_AddBook");
            break;
        case QRBookDebugModelOptionViewTag_DefaultBook:
            NSLog(@"QRBookDebugModelOptionViewTag_DefaultBook");
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
    return @[@{@"title": @"导入书使用精排引擎",
               @"icon": @"",
               @"viewTag": @(QRBookDebugModelOptionViewTag_HKEngine)},
             @{@"title": @"最大书籍限制",
               @"icon": @"",
               @"viewTag": @(QRBookDebugModelOptionViewTag_ShelfMaxCount)},
             @{@"title": @"添加书籍",
               @"icon": @"",
               @"viewTag": @(QRBookDebugModelOptionViewTag_AddBook)},
             @{@"title": @"导出内置书调试",
               @"icon": @"",
               @"viewTag": @(QRBookDebugModelOptionViewTag_DefaultBook)},];
}

@end

