//
//  HCDebugToolManager.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCDebugToolModuleProtocol.h"

typedef NS_OPTIONS(NSInteger, HCDebugToolModuleSortLevel) {
    HCDebugToolModuleSortLevel_Low = 0,
    HCDebugToolModuleSortLevel_Middle = 50,
    HCDebugToolModuleSortLevel_Height = 100,
};

@interface HCDebugToolManager : NSObject

+ (instancetype)sharedManager;

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module;
- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(HCDebugToolModuleSortLevel)sortLevel;

- (NSArray <NSObject <HCDebugToolModuleProtocol> *> *)registeredModules;

@end
