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

- (NSArray <NSDictionary *>*)optionDicts;
- (void)dismissMenu:(void (^)(void))completion;
- (void)dismissMenu;

@end

extern const struct HCDebugCommonModuleOptionKeys {
    __unsafe_unretained NSString *title;
    __unsafe_unretained NSString *viewTag;
    __unsafe_unretained NSString *hasSwich;
    __unsafe_unretained NSString *isSwichOn;
} HCDebugCommonModuleOptionKeys;
