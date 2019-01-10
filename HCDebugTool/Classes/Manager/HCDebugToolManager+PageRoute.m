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
    if (self.naviVC.isViewLoaded && self.naviVC.view.window) {
        [self.naviVC presentViewController:viewController
                                  animated:YES
                                completion:nil];
    } else {
        UIViewController *currentVC = [self getCurrentVC];
        [currentVC presentViewController:viewController
                                animated:YES
                              completion:nil];
    }
}

- (UIViewController *)getCurrentVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    
    return currentVC;
}

@end
