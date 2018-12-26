//
//  HCUIDefine.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/26.
//  Copyright © 2018 honchwong404@gmail.com. All rights reserved.
//

#ifndef HCUIDefine_h
#define HCUIDefine_h

#define kIs_iPhoneX         ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavBarHeight       (kIs_iPhoneX ? 88 : 64)

#endif /* HCUIDefine_h */
