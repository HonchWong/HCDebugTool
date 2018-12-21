//
//  HCDebugToolManager.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCDebugToolManager : NSObject

+ (instancetype)sharedManager;

@end

extern const struct HCDebugToolManagerKeys {
    __unsafe_unretained NSString *autoShowEntranceViewDisable;
} HCDebugToolManagerKeys;
