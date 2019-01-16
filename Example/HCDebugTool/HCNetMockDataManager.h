//
//  HCNetMockDataManager.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCNetMockIntroViewModel.h"

typedef void (^HCNetMockDataManagerCompletionHandler)(BOOL success,  NSArray <HCNetMockIntroViewModel *>*viewModels);

typedef HCNetMockDataManagerCompletionHandler HCNetMockIntroHandler;

@interface HCNetMockDataManager : NSObject

+ (void)requestIntroViewModelWithCompletionHandler:(HCNetMockIntroHandler)handler;

@end

