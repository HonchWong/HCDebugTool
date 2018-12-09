//
//  HCDebugToolCommonOptionItemView.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCDebugToolCommonOptionViewModel.h"

@protocol HCDebugToolCommonOptionItemViewDelegate <NSObject>

@optional

- (void)optionItem:(HCDebugToolCommonOptionItemViewModel *)viewModel
       didChangeSwitch:(BOOL)isOn;

@end

@interface HCDebugToolCommonOptionItemView : UIView

@property (nonatomic, weak) NSObject<HCDebugToolCommonOptionItemViewDelegate> *delegate;

- (void)setViewModel:(HCDebugToolCommonOptionItemViewModel *)viewModel;

@end
