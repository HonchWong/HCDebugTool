//
//  HCDebugToolEntranceView.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/4.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HCDebugToolEntranceViewActionDelegate <NSObject>

- (void)doEntraceAction;

@end

@interface HCDebugToolEntranceView : UIView

@property (nonatomic, weak) id<HCDebugToolEntranceViewActionDelegate> delegate;


- (void)startAnim:(CGFloat)duration;

@end
