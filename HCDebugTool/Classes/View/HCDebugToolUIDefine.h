//
//  HCDebugToolUIDefine.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/4.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#ifndef HCDebugToolUIDefine_h
#define HCDebugToolUIDefine_h

#define kIs_iPhoneX         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavBarHeight       (kIs_iPhoneX ? 88 : 64)
#endif /* HCDebugToolUIDefine_h */
