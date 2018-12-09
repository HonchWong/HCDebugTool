//
//  HCDebugToolCommonModule.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCDebugToolModuleProtocol.h"
#import "HCDebugToolCommonOptionView.h"

@interface HCDebugToolCommonModule : NSObject <HCDebugToolModuleProtocol, HCDebugToolCommonOptionViewDelegate>

- (HCDebugToolCommonOptionViewModel *)optionViewModel;

@end
