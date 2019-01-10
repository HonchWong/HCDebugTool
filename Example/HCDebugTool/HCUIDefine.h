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

#define HCScreenWidth [UIScreen mainScreen].bounds.size.width
#define HCScreenHeight [UIScreen mainScreen].bounds.size.height

#define DoraemonScreenWidth [UIScreen mainScreen].bounds.size.width
#define DoraemonScreenHeight [UIScreen mainScreen].bounds.size.height

//根据750*1334分辨率计算size
#define kDoraemonSizeFrom750(x)                ((x)*DoraemonScreenWidth/750)

//#define IPHONE_SAFEBOTTOMAREA_HEIGHT (IS_IPHONE_X_Series ? 34 : 0)

#define DoraemonShowPluginNotification @"DoraemonShowPluginNotification"
#define DoraemonClosePluginNotification @"DoraemonClosePluginNotification"
#define DoraemonQuickOpenLogVCNotification @"DoraemonQuickOpenLogVCNotification"

#define BugCommitNotification @"BugCommitNotification"

#endif /* HCUIDefine_h */
