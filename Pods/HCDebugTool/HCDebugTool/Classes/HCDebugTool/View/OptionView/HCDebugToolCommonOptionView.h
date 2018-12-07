//
//  HCDebugToolCommonOptionView.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCDebugToolCommonOptionViewModel.h"

@protocol HCDebugToolCommonOptionViewProtocol <NSObject>

@optional

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option atIndex:(NSInteger)index;

@end

@interface HCDebugToolCommonOptionView : UIView

@property (nonatomic, weak) NSObject<HCDebugToolCommonOptionViewProtocol> *delegate;

- (void)setViewModel:(HCDebugToolCommonOptionViewModel *)viewModel;
+ (CGFloat)viewHeightWithModel:(HCDebugToolCommonOptionViewModel *)viewModel;


@end
