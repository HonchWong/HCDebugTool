//
//  HCDebugToolManager+Module.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import <HCDebugTool/HCDebugTool.h>
#import "HCDebugToolModuleProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HCDebugToolManager (Module)

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module;
/**
 @param sortLevel defule is 0
 */
- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(NSInteger)sortLevel;

- (NSArray <NSObject <HCDebugToolModuleProtocol> *> *)afterSortModules;

@end

NS_ASSUME_NONNULL_END
