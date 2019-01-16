//
//  HCNetMockDataManager.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockDataManager.h"

@implementation HCNetMockDataManager

+ (void)requestIntroViewModelWithCompletionHandler:(HCNetMockIntroHandler)handler {
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"bookList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *mockListDicts = rootDict[@"mockList"];
    
    NSMutableArray <HCNetMockIntroViewModel *>*temp = [NSMutableArray array];
    [mockListDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [temp addObject:[[HCNetMockIntroViewModel alloc] initWithDictionary:obj]];
    }];
    
    if (handler) {
        handler(YES, temp.copy);
    }
}

@end
