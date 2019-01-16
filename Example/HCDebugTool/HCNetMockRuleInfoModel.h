//
//  HCNetMockRuleInfoModel.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCNetMockRuleItemModel.h"

typedef NS_OPTIONS(NSInteger, HCNetMockRequestType) {
    HCNetMockRequestType_Get = 1,
    HCNetMockRequestType_Post,
};

@interface HCNetMockRuleInfoModel : NSObject

@property (nonatomic, assign) HCNetMockRequestType requestType;
@property (nonatomic, strong) NSArray <HCNetMockRuleItemModel *>* rules;

- (instancetype)initWithDict:(NSDictionary *)dict;


@end

