//
//  HCLeftPicRightTextViewModel.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/26.
//  Copyright © 2018 honchwong404@gmail.com. All rights reserved.
//

#import "HCLeftPicRightTextViewModel.h"

@implementation HCLeftPicRightTextViewModel

@synthesize cover;
@synthesize author;
@synthesize intro;
@synthesize title;

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = [dict objectForKey:@"title"];
        self.intro = [dict objectForKey:@"intro"];
        self.author = [dict objectForKey:@"author"];
    }
    return self;
}

- (NSString *)cover {
    return @"cover";
}

@end
