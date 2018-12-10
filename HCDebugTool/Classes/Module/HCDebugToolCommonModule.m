//
//  HCDebugToolCommonModule.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolCommonModule.h"
#import "HCDebugToolManager.h"

@interface HCDebugToolCommonModule ()

@property (nonatomic, strong) HCDebugToolCommonOptionView *optionView;
@property (nonatomic, strong) NSString *cellIdentifier;
@end

@implementation HCDebugToolCommonModule

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configProperty];
    }
    return self;
}

- (void)configProperty {
    self.cellIdentifier =
    [NSString stringWithFormat:@"tableViewCellIdentifier_%x", arc4random()];
}

#pragma mark - HCDebugToolModuleProtocol

- (NSInteger)numberOfRows {
    return self.optionView ? 1 : 0;
}

- (CGFloat)heightForRow:(NSInteger)row {
    return self.optionView ? CGRectGetHeight(self.optionView.frame) : 0;
}

- (UITableViewCell *)cellForRow:(NSInteger)row
                      tableView:(UITableView *)tableView {
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:self.cellIdentifier];
        [cell.contentView addSubview:self.optionView];
    }
    
    return cell;
}

- (NSString *)moduleTitle {
    return @"";
}

#pragma mark - getter

- (HCDebugToolCommonOptionView *)optionView {
    if (!_optionView) {
        HCDebugToolCommonOptionViewModel *viewModel = [self optionViewModel];
        if (!viewModel) {
            return nil;
        }
        _optionView = [[HCDebugToolCommonOptionView alloc] init];
        [_optionView setViewModel:viewModel];
        CGFloat viewHeight =
        [HCDebugToolCommonOptionView viewHeightWithModel:[self optionViewModel]];
        _optionView.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), viewHeight);
        _optionView.delegate = self;
    }
    return _optionView;
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
        optionItemViewModel.title = [optionItem objectForKey:HCDebugCommonModuleOptionKeys.title];
        optionItemViewModel.viewTag = [[optionItem objectForKey:HCDebugCommonModuleOptionKeys.viewTag] integerValue];
        optionItemViewModel.hasSwich = [[optionItem objectForKey:HCDebugCommonModuleOptionKeys.hasSwich] boolValue];
        optionItemViewModel.isSwichOn = [[optionItem objectForKey:HCDebugCommonModuleOptionKeys.isSwichOn] boolValue];
        [tempArray addObject:optionItemViewModel];
    }
    HCDebugToolCommonOptionViewModel *optionViewModel = [[HCDebugToolCommonOptionViewModel alloc] init];
    optionViewModel.items = tempArray;
    return optionViewModel;
}

- (NSArray <NSDictionary *>*)optionDicts {
    return nil;
}

@end


const struct HCDebugCommonModuleOptionKeys
HCDebugCommonModuleOptionKeys = {
    .title = @"title",
    .viewTag = @"viewTag",
    .hasSwich = @"hasSwich",
    .isSwichOn = @"isSwichOn",
};
