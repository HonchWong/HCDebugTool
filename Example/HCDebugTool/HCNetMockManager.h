//
//  HCNetMockManager.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCNetMockIntroViewModel.h"
#import "HCNetMockRuleInfoModel.h"

typedef void (^HCNetMockManagerDataCompletionHandler)(BOOL success,  NSArray <HCNetMockIntroViewModel *>*viewModels);

typedef HCNetMockManagerDataCompletionHandler HCNetMockIntroHandler;

@interface HCNetMockManager : NSObject

- (void)requestIntroViewModelWithCompletionHandler:(HCNetMockIntroHandler)handler;

- (HCNetMockRuleInfoModel *)ruleInfoWithMockIdentity:(NSString *)identity;

- (void)startMockWithIdentity:(NSString *)identity;
- (void)stopMockWithIdentity:(NSString *)identity;

- (void)startAllMock;
- (void)stopAllMock;

@end
