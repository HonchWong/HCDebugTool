//
//  HCDebugToolManager.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolManager.h"
#import "HCDebugToolEntranceView.h"

@interface HCDebugToolManager ()

@property (nonatomic, strong) NSMutableArray <NSObject <HCDebugToolModuleProtocol>*> *modules;
@property (nonatomic, strong) HCDebugToolEntranceView *entranceView;

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

- (instancetype)init {
    if (self = [super init]) {
        [self performSelector:@selector(setupEntranceView) withObject:nil afterDelay:2];
    }
    return self;
}

- (void)setupEntranceView {
    self.entranceView = [[HCDebugToolEntranceView alloc] init];
}

- (void)hideDebugTool {
    [self.entranceView hideMenuView];
}

//- (NSArray <NSObject <HCDebugToolModuleProtocol> *> *)registeredModules {
//    return [self.modules copy];
//}

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module {
    [self registerModule:module
              sortLevel:HCDebugToolModuleSortLevel_Height];
}

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(HCDebugToolModuleSortLevel)sortLevel {
    NSInteger moduleCount = self.modules.count - 1;
    NSInteger insertIndex = 0;
    
    switch (sortLevel) {
        case HCDebugToolModuleSortLevel_Height:
            insertIndex = 0;
            break;
        case HCDebugToolModuleSortLevel_Middle:
            insertIndex = moduleCount * 0.5;
            break;
        case HCDebugToolModuleSortLevel_Low:
            insertIndex = moduleCount;
            break;
            
        default:
            break;
    }
    [self.modules insertObject:module
                       atIndex:insertIndex];
}

- (NSMutableArray<NSObject<HCDebugToolModuleProtocol> *> *)modules {
    if (!_modules) {
        _modules = [NSMutableArray array];
    }
    return _modules;
}
@end
