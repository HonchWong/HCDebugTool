//
//  HCNetMockIntroViewModel.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/15.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockIntroViewModel.h"

@implementation HCNetMockIntroViewModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.urlDetail = [dict objectForKey:@"urlDetail"];
        self.urlDesc = [dict objectForKey:@"urlDesc"];
    }
    return self;
}

@end
