//
//  HCLeftPicRightTextViewModel.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/26.
//  Copyright © 2018 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCLeftPicRightTextViewModelProtocol.h"

@interface HCLeftPicRightTextViewModel : NSObject <HCLeftPicRightTextViewModelProtocol>

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

