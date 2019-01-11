//
//  HCBugBillModel.h
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCBugItemModel.h"

@interface HCBugBillModel : NSObject

@property (nonatomic, strong) UIImage *bugPicture;
@property (nonatomic, strong) NSArray <HCBugItemModel *> *bugItems;

- (UIImage *)generateBugDetailPicture;

@end

