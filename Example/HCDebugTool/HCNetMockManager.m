//
//  HCNetMockManager.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockManager.h"

@interface HCNetMockManager ()

@property (nonatomic, strong) NSDictionary *mockRuleIdentityDict;
@property (nonatomic, strong) NSArray *mockListDicts;

@end

@implementation HCNetMockManager

- (void)requestIntroViewModelWithCompletionHandler:(HCNetMockIntroHandler)handler {
    NSMutableArray <HCNetMockIntroViewModel *>*temp = [NSMutableArray array];
    [self.mockListDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [temp addObject:[[HCNetMockIntroViewModel alloc] initWithDictionary:obj]];
    }];
    
    if (handler) {
        handler(YES, temp.copy);
    }
}

- (HCNetMockRuleInfoModel *)ruleInfoWithMockIdentity:(NSString *)identity {
    NSDictionary *rulInfo = [self.mockRuleIdentityDict objectForKey:identity];
    return [[HCNetMockRuleInfoModel alloc] initWithDict:rulInfo];
}


- (void)startMockWithIdentity:(NSString *)identity {
    
}

- (void)stopMockWithIdentity:(NSString *)identity {
    
}

- (void)startAllMock {
    
}

- (void)stopAllMock {
    
}

#pragma mark - getter

- (NSDictionary *)mockRuleIdentityDict {
    if (!_mockRuleIdentityDict) {
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"mockRule" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        _mockRuleIdentityDict = rootDict;
    }
    return _mockRuleIdentityDict;
}

- (NSArray *)mockListDicts {
    if (!_mockListDicts) {
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"mockList" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *mockListDicts = rootDict[@"mockList"];
        _mockListDicts = mockListDicts;
    }
    return _mockListDicts;
}

@end
