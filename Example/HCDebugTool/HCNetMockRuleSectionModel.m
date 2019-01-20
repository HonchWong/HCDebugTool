//
//  HCNetMockRuleSectionModel.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/20.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockRuleSectionModel.h"

@implementation HCNetMockRuleSectionModel

- (void)parseDict:(NSDictionary *)dict {
    NSArray *data = [dict objectForKey:@"data"];
    NSInteger ruleType = [[dict objectForKey:@"type"] integerValue];
    
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in data) {
        HCNetMockRuleItemModel *item = [[HCNetMockRuleItemModel alloc] init];
        item.enable = [dict objectForKey:@"enable"];
        item.errorData = [dict objectForKey:@"errorData"];
        item.ruleName = [dict objectForKey:@"ruleName"];
        item.modifyField = [dict objectForKey:@"field"];
        item.jsonPath = [dict objectForKey:@"path"];
        item.ruleType = ruleType;
        [temp addObject:item];
    }
    self.items = temp;
}

@end
