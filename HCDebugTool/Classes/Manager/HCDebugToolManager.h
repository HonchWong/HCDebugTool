//
//  HCDebugToolManager.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCDebugToolModuleProtocol.h"

@interface HCDebugToolManager : NSObject

+ (instancetype)sharedManager;

- (void)hideDebugTool;

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module;

/**
 @param sortLevel defule is 0
 */
- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(NSInteger)sortLevel;

- (NSArray <NSObject <HCDebugToolModuleProtocol> *> *)afterSortModules;

@end
