//
//  HCDebugToolCommonOptionView.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCDebugToolCommonOptionViewModel.h"

@protocol HCDebugToolCommonOptionViewDelegate <NSObject>

@optional

- (void)optionDidSelected:(HCDebugToolCommonOptionItemViewModel *)option atIndex:(NSInteger)index;
- (void)optionSwitchDidChage:(HCDebugToolCommonOptionItemViewModel *)option status:(BOOL)isOn;
@end

@interface HCDebugToolCommonOptionView : UIView

@property (nonatomic, weak) NSObject<HCDebugToolCommonOptionViewDelegate> *delegate;

- (void)setViewModel:(HCDebugToolCommonOptionViewModel *)viewModel;
+ (CGFloat)viewHeightWithModel:(HCDebugToolCommonOptionViewModel *)viewModel;


@end
