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

@property (nonatomic, strong) NSMutableDictionary *modulesDict;
@property (nonatomic, strong) NSMutableArray <NSObject <HCDebugToolModuleProtocol>*> *afterSortModules;
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

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module {
    [self registerModule:module
              sortLevel:[self legalKey:0]];
}

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(NSInteger)sortLevel {

    [self.modulesDict setObject:module forKey:@(sortLevel)];
    _afterSortModules = nil;
}

- (NSMutableArray<NSObject<HCDebugToolModuleProtocol> *> *)afterSortModules {
    if (!self.modulesDict.count) {
        return nil;
    }
    
    if (!_afterSortModules) {
        NSArray *keys = self.modulesDict.allKeys;
        NSArray *afterSortKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 integerValue] > [obj2 integerValue] ? NSOrderedAscending : NSOrderedDescending;
        }];
        
        _afterSortModules = [NSMutableArray array];
        for (NSNumber *key in afterSortKeys) {
            [_afterSortModules addObject:[self.modulesDict objectForKey:key]];
        }
    }
    return _afterSortModules;
}

- (NSMutableDictionary *)modulesDict {
    if (!_modulesDict) {
        _modulesDict = [NSMutableDictionary dictionary];
    }
    return _modulesDict;
}

- (NSInteger )legalKey:(NSInteger)key {
    if ([self.modulesDict.allKeys containsObject:@(key)]) {
        return [self legalKey:key + 1];
    } else {
        return key;
    }
}

@end
