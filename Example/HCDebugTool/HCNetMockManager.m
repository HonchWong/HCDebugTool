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
@property (nonatomic, strong) NSDictionary <NSString *, NSArray <HCNetMockRuleSectionModel *>*> *sectionModelDict;
@property (nonatomic, strong) NSMutableDictionary <NSString *, HCNetMockRuleInfoModel *> *ruleInfoDict;

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

- (NSArray <HCNetMockRuleSectionModel *>*)sectionModelWithMockIdentity:(NSString *)identity {
    return [self.sectionModelDict objectForKey:identity];
}

- (void)startMockWithIdentity:(NSString *)identity {
    
}

- (void)stopMockWithIdentity:(NSString *)identity {
    
}

- (void)startAllMock {
    
}

- (void)stopAllMock {
    
}

- (void)    saveRule:(HCNetMockRuleInfoModel *)ruleInfo
    withMockIdentity:(NSString *)identity {
    NSDictionary *dict = [self.mockRuleIdentityDict objectForKey:identity];
    ruleInfo.requestType = [[dict objectForKey:@"requestType"] integerValue];
    [self.ruleInfoDict setObject:ruleInfo forKey:identity];
}

- (HCNetMockRuleInfoModel *)ruleInfoWithMockIdentity:(NSString *)identity {
    return [self.ruleInfoDict objectForKey:identity];
}

#pragma mark - getter

- (NSDictionary *)mockRuleIdentityDict {
    if (!_mockRuleIdentityDict) {
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"mockRule" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        _mockRuleIdentityDict = [rootDict objectForKey:@"mockRule"];
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

- (NSDictionary<NSString *,NSArray<HCNetMockRuleSectionModel *> *> *)sectionModelDict {
    if (!_sectionModelDict) {
        NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
        [self.mockRuleIdentityDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSInteger requestType = [[obj objectForKey:@"requestType"] integerValue];
            NSArray *rules = [obj objectForKey:@"rules"];
            NSMutableArray <HCNetMockRuleSectionModel *>*sectionModels = [NSMutableArray array];
            for (NSDictionary *dict in rules) {
                NSArray *data = [dict objectForKey:@"data"];
                NSInteger type = [[dict objectForKey:@"type"] integerValue];

                NSMutableArray *temp = [NSMutableArray array];
                for (NSDictionary *dict in data) {
                    BOOL forceRuleDisable = [self.ruleInfoDict objectForKey:key] ? YES : NO;
                    HCNetMockRuleItemModel *item = [[HCNetMockRuleItemModel alloc] init];
                    item.enable = forceRuleDisable ? NO : [dict objectForKey:@"enable"];
                    item.errorData = [dict objectForKey:@"errorData"];
                    item.ruleName = [dict objectForKey:@"ruleName"];
                    item.modifyField = [dict objectForKey:@"field"];
                    item.jsonPath = [dict objectForKey:@"path"];
                    item.ruleType = type;
                    [temp addObject:item];
                    
                    if (item.enable) {
                        HCNetMockRuleInfoModel *ruleInfo = [[HCNetMockRuleInfoModel alloc] init];
                        ruleInfo.rule = item;
                        ruleInfo.requestType = requestType;
                        [self.ruleInfoDict setValue:ruleInfo forKey:key];
                    }
                }
                HCNetMockRuleSectionModel *sectionModel =
                [[HCNetMockRuleSectionModel alloc] init];
                sectionModel.items = temp;
                
                switch (type) {
                    case HCNetMockRuleType_Error:
                        sectionModel.title = @"错误返回";
                        break;
                    case HCNetMockRuleType_Empty:
                        sectionModel.title = @"空返回";
                        break;
                    case HCNetMockRuleType_ModifyField:
                        sectionModel.title = @"修改字段";
                        break;
                    case HCNetMockRuleType_ModifyNativeJson:
                        sectionModel.title = @"使用本地Json";
                        break;
                    case HCNetMockRuleType_ModifyNetJson:
                        sectionModel.title = @"使用网络Json";
                        break;
                }
                [sectionModels addObject:sectionModel];
            }
            [tempDict setValue:sectionModels forKey:key];
        }];
        _sectionModelDict = tempDict;
    }
    return _sectionModelDict;
}

- (NSMutableDictionary<NSString *,HCNetMockRuleInfoModel *> *)ruleInfoDict {
    if (!_ruleInfoDict) {
        _ruleInfoDict = [NSMutableDictionary dictionary];
    }
    return _ruleInfoDict;
}

@end
