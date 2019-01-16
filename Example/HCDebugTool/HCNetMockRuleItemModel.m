//
//  HCNetMockRuleItemModel.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockRuleItemModel.h"

@implementation HCNetMockRuleItemModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self handleJson:dict];
    }
    return self;
}

- (void)handleJson:(NSDictionary *)dict {
    self.type = [[dict objectForKey:@"type"] integerValue];
    self.enable = [[dict objectForKey:@"enable"] boolValue];
    
    switch (self.type) {
        case HCNetMockRuleType_Error:
            self.errorData = [dict objectForKey:@"errorData"];
            break;
        case HCNetMockRuleType_ModifyField:
            self.modifyField = [dict objectForKey:@"field"];
            break;
        case HCNetMockRuleType_ModifyNativeJson:
            self.nativeJsonPath = [dict objectForKey:@"path"];
            break;
        case HCNetMockRuleType_ModifyNetJson:
            self.netJsonPath = [dict objectForKey:@"path"];
            break;
        case HCNetMockRuleType_Empty:
            break;
        default:
            break;
    }
}

@end
