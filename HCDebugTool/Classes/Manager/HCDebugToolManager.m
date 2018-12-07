//
//  HCDebugToolManager.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolManager.h"

@interface HCDebugToolManager ()

@property (nonatomic, strong) NSMutableArray <NSObject <HCDebugToolModuleProtocol>*> *modules;

@end

@implementation HCDebugToolManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static HCDebugToolManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[HCDebugToolManager alloc] init];
    });
    return manager;
}

- (NSArray <NSObject <HCDebugToolModuleProtocol> *> *)registeredModules {
    return [self.modules copy];
}

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module {
    [self.modules addObject:module];
}

- (NSMutableArray<NSObject<HCDebugToolModuleProtocol> *> *)modules {
    if (!_modules) {
        _modules = [NSMutableArray array];
    }
    return _modules;
}
@end
