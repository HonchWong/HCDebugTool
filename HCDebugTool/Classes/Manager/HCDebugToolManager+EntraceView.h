//
//  HCDebugToolManager+EntraceView.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import <HCDebugTool/HCDebugTool.h>


@interface HCDebugToolManager (EntraceView)

- (void)showEntranceView;

- (void)showMenuView;

- (void)hideMenuView;
- (void)hideMenuView:(void (^)(void))completion;

@end
