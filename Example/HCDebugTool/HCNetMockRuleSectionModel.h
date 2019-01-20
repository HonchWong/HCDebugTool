//
//  HCNetMockRuleSectionModel.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/20.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCNetMockRuleItemModel.h"

@interface HCNetMockRuleSectionModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray <HCNetMockRuleItemModel *>*items;

- (void)parseDict:(NSDictionary *)dict;

@end

