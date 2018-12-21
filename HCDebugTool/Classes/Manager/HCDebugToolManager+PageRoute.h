//
//  HCDebugToolManager+PageRoute.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/20.
//

#import <HCDebugTool/HCDebugTool.h>

NS_ASSUME_NONNULL_BEGIN

@interface HCDebugToolManager (PageRoute)

- (void)pushViewController:(UIViewController *)viewController;
- (void)presentViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
