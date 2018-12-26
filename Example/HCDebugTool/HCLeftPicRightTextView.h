//
//  HCLeftPicRightTextView.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/21.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HCLeftPicRightTextViewModelProtocol;

@interface HCLeftPicRightTextView : UIView

- (void)setViewModel:(id<HCLeftPicRightTextViewModelProtocol>)viewModel;

@end
