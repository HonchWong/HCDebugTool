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

//@interface HCDebugToolVisionModule () <HCDebugToolCommonOptionViewProtocol>

//@property (nonatomic, strong) HCDebugToolCommonOptionView *optionView;

//@end

@implementation HCDebugToolVisionModule

#pragma mark - HCDebugToolModuleProtocol

//- (NSInteger)numberOfRows {
//    return 1;
//}
//
//- (CGFloat)heightForRow:(NSInteger)row {
//    return CGRectGetHeight(self.optionView.frame);
//}
//
//- (UITableViewCell *)cellForRow:(NSInteger)row
//                      tableView:(UITableView *)tableView {
//    NSString *cellIdentifier = @"tableViewCellIdentifier";
//
//    UITableViewCell *cell =
//    [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:cellIdentifier];
//    }
//
//    [self.optionView removeFromSuperview];
//    [cell.contentView addSubview:self.optionView];
//
//    return cell;
//}

#pragma mark - Private

+ (void)load {
    [[HCDebugToolManager sharedManager] registerModule:[[self alloc] init]];
}

#pragma mark - HCDebugToolCommonOptionViewProtocol

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

#pragma mark - getter

//- (HCDebugToolCommonOptionView *)optionView {
//    if (!_optionView) {
//        _optionView = [[HCDebugToolCommonOptionView alloc] init];
//        HCDebugToolCommonOptionViewModel *viewModel =
//        [self.class optionViewModel];
//        [_optionView setViewModel:viewModel];
//        CGFloat viewHeight =
//        [HCDebugToolCommonOptionView viewHeightWithModel:[self optionViewModel]];
//        _optionView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), viewHeight);
//        _optionView.delegate = self;
//    }
//    return _optionView;
//}

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
    optionViewModel.title = @"视觉工具";
    optionViewModel.items = tempArray;
    return optionViewModel;
}

- (NSArray <NSDictionary *>*)optionDicts {
    return @[@{@"title": @"颜色检查",
               @"icon": @"",
               @"viewTag": @(HCDebugToolVisionOptionViewTag_ColorCheck)},
             @{@"title": @"对齐检查",
               @"icon": @"",
               @"viewTag": @(HCDebugToolVisionOptionViewTag_PointCheck)}];
}

@end
