//
//  HCDebugToolManager+EntraceView.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import "HCDebugToolManager+EntraceView.h"
#import "HCDebugToolEntranceViewController.h"

@interface HCDebugToolManager ()

@property (nonatomic, strong) HCDebugToolEntranceViewController *entranceVC;

@end

@implementation HCDebugToolManager (EntraceView)

- (void)showEntranceView {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.entranceVC showEntranceView];
//        [self.entranceVC showMenuView];
//    });
}

- (void)showMenuView {
    [self.entranceVC showMenuView];
}

- (void)hideMenuView {
    [self hideMenuView:nil];
}

- (void)hideMenuView:(void (^)(void))completion {
    [self.entranceVC hideMenuView:completion];
}

- (void)checkAutoShowEntranceView {
    BOOL isAutoShowEntranceViewDisable =
    [[NSUserDefaults standardUserDefaults] objectForKey:HCDebugToolManagerKeys.autoShowEntranceViewDisable];
    if (!isAutoShowEntranceViewDisable) {
        [self performSelector:@selector(showEntranceView) withObject:nil afterDelay:3];
    }
}

- (void)setAutoShowEntranceViewDisable:(BOOL)isDisable {
    [[NSUserDefaults standardUserDefaults] setBool:isDisable
                                            forKey:HCDebugToolManagerKeys.autoShowEntranceViewDisable];
}

@end
