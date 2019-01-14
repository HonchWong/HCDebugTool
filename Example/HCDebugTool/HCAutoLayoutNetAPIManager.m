//
//  HCAutoLayoutNetAPIManager.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/14.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCAutoLayoutNetAPIManager.h"
#import "AFNetworking.h"
#import "HCLeftPicRightTextViewModel.h"

@implementation HCAutoLayoutNetAPIManager

+ (void)requestBookListWithCompletionHandler:(HCAutoLayoutNetHandler)handler {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[[NSURL alloc] initWithString:@"https://www.easy-mock.com"]];
    [manager GET:@"mock/5b877ba37eb5e51ccf7d4db1/example/testBookList" parameters:nil progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSMutableArray <HCLeftPicRightTextViewModel *>*resultArray = [[NSMutableArray alloc] init];
             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                 NSArray *bookList = [responseObject objectForKey:@"bookList"];
                 if ([bookList isKindOfClass:[NSArray class]]) {
                     for (NSDictionary *book in bookList) {
                         if ([book isKindOfClass:[NSDictionary class]]) {
                             HCLeftPicRightTextViewModel *viewModel =
                             [[HCLeftPicRightTextViewModel alloc] initWithDictionary:book];
                             [resultArray addObject:viewModel];
                         }
                     }
                 }
             }
             if (handler) {
                 handler(YES, resultArray);
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (handler) {
                 handler(NO, nil);
             }
         }];
}

@end
