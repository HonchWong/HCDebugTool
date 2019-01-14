//
//  HCAutoLayoutNetAPIManager.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/14.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCLeftPicRightTextViewModelProtocol.h"

typedef void (^HCAutoLayoutNetAPIManagerCompletionHandler)(BOOL success,  NSArray <id<HCLeftPicRightTextViewModelProtocol>>*bookList);

typedef HCAutoLayoutNetAPIManagerCompletionHandler HCAutoLayoutNetHandler;

@interface HCAutoLayoutNetAPIManager : NSObject

+ (void)requestBookListWithCompletionHandler:(HCAutoLayoutNetHandler)handler;

@end

