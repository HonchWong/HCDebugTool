//
//  HCDebugModuleSortLevel.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/20.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#ifndef HCDebugModuleSortLevel_h
#define HCDebugModuleSortLevel_h

typedef NS_OPTIONS(NSInteger, QRDebugModuleSortLevel) {
    QRDebugModuleSortLevel_Net = 3000,             // 网络调试工具
    QRDebugModuleSortLevel_YogaKit = 2000,         // YogaKit调试
    QRDebugModuleSortLevel_Vision = 300,           // 视觉工具调试
};

#endif /* HCDebugModuleSortLevel_h */
