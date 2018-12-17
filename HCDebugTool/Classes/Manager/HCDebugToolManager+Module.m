//
//  HCDebugToolManager+Module.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import "HCDebugToolManager+Module.h"

@interface HCDebugToolManager ()

@property (nonatomic, strong) NSMutableDictionary *modulesDict;
@property (nonatomic, strong) NSMutableArray <NSObject <HCDebugToolModuleProtocol>*> *modules;

@end

@implementation HCDebugToolManager (Module)

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module {
    [self registerModule:module
               sortLevel:[self legalKey:0]];
}

- (void)registerModule:(NSObject <HCDebugToolModuleProtocol>*)module
             sortLevel:(NSInteger)sortLevel {
    if (!self.modulesDict) {
        self.modulesDict = [NSMutableDictionary dictionary];
    }
    [self.modulesDict setObject:module forKey:@(sortLevel)];
    
    self.modules = nil;
}

- (NSMutableArray<NSObject<HCDebugToolModuleProtocol> *> *)afterSortModules {
    if (!self.modulesDict.count) {
        return nil;
    }
    
    if (!self.modules) {
        NSArray *keys = self.modulesDict.allKeys;
        NSArray *afterSortKeys =
        [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
         {
             return [obj1 integerValue] > [obj2 integerValue] ? NSOrderedAscending : NSOrderedDescending;
         }];
        
        self.modules = [NSMutableArray array];
        for (NSNumber *key in afterSortKeys) {
            [self.modules addObject:[self.modulesDict objectForKey:key]];
        }
    }
    return self.modules;
}

- (NSInteger )legalKey:(NSInteger)key {
    if ([self.modulesDict.allKeys containsObject:@(key)]) {
        return [self legalKey:key + 1];
    } else {
        return key;
    }
}

@end
