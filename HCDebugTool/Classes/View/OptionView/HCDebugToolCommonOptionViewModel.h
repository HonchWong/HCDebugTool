//
//  HCDebugToolCommonOptionViewModel.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HCDebugToolCommonOptionItemViewModel;

@interface HCDebugToolCommonOptionViewModel : NSObject

@property (nonatomic, strong) NSArray <HCDebugToolCommonOptionItemViewModel *> *items;

@end

@interface HCDebugToolCommonOptionItemViewModel : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger viewTag;

@property (nonatomic, assign) BOOL hasSwich;
@property (nonatomic, assign) BOOL isSwichOn;

@end
