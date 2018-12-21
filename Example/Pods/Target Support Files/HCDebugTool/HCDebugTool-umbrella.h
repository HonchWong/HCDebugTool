#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HCDebugTool.h"
#import "HCDebugToolManager+EntraceView.h"
#import "HCDebugToolManager+Module.h"
#import "HCDebugToolManager+PageRoute.h"
#import "HCDebugToolManager.h"
#import "HCDebugToolCommonModule.h"
#import "HCDebugToolModuleProtocol.h"
#import "HCDebugToolVisionModule.h"
#import "HCDebugToolEntranceView.h"
#import "HCDebugToolEntranceViewController.h"
#import "HCDebugToolUIDefine.h"
#import "HCDebugToolMenuViewController.h"
#import "HCDebugToolCommonOptionItemView.h"
#import "HCDebugToolCommonOptionView.h"
#import "HCDebugToolCommonOptionViewModel.h"

FOUNDATION_EXPORT double HCDebugToolVersionNumber;
FOUNDATION_EXPORT const unsigned char HCDebugToolVersionString[];

