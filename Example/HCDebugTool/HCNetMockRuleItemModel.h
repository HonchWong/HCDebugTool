//
//  HCNetMockRuleItemModel.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, HCNetMockRuleType) {
    HCNetMockRuleType_Error = 1,
    HCNetMockRuleType_Empty,
    HCNetMockRuleType_ModifyField,
    HCNetMockRuleType_ModifyNativeJson,
    HCNetMockRuleType_ModifyNetJson,
};

@interface HCNetMockRuleItemModel : NSObject

@property (nonatomic, assign) HCNetMockRuleType ruleType;
@property (nonatomic, strong) NSString *ruleName;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, strong) NSString *jsonPath;
@property (nonatomic, strong) NSDictionary *modifyField;
@property (nonatomic, strong) NSDictionary *errorData;

@end

