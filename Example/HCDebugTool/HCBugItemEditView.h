//
//  HCBugItemEditView.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HCBugItemEditView;
@class HCBugItemModel;

@protocol HCBugItemEditViewDelegate <NSObject>

- (void)editView:(HCBugItemEditView *)view didEndEdit:(NSString *)content;
- (void)editView:(HCBugItemEditView *)view willBeginEdit:(NSString *)content;

@end

@interface HCBugItemEditView : UIView

+ (CGFloat)viewHeight;

@property (nonatomic, weak) id<HCBugItemEditViewDelegate> delegate;
@property (nonatomic, strong) HCBugItemModel *model;

@end

