//
//  HCNetMockRuleInfoModel.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockRuleInfoModel.h"

@implementation HCNetMockRuleInfoModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self handleJson:dict];
    }
    return self;
}

- (void)handleJson:(NSDictionary *)dict {
    self.requestType = [[dict objectForKey:@"requestType"] integerValue];
    NSArray *rules = [dict objectForKey:@"rules"];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *rule in rules) {
        HCNetMockRuleItemModel *item =
        [[HCNetMockRuleItemModel alloc] initWithDict:rule];
        [temp addObject:item];
    }
    self.rules = temp.copy;
}

@end
