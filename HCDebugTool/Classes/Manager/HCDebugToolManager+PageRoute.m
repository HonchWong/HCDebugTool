//
//  HCDebugToolManager+PageRoute.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/20.
//

#import "HCDebugToolManager+PageRoute.h"

@interface HCDebugToolManager ()

@property (nonatomic, strong) UINavigationController *naviVC;

@end

@implementation HCDebugToolManager (PageRoute)

- (void)pushViewController:(UIViewController *)viewController {
    [self.naviVC pushViewController:viewController animated:YES];
}

- (void)presentViewController:(UIViewController *)viewController {
    [self.naviVC presentViewController:viewController
                              animated:YES
                            completion:nil];
}

@end
