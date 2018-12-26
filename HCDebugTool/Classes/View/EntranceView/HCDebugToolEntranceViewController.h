//
//  HCDebugToolEntranceViewController.h
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import <UIKit/UIKit.h>


@interface HCDebugToolEntranceViewController : UIViewController

- (instancetype)initWithNaviVC:(UINavigationController *)naviVC;

- (void)showEntranceView;

- (void)showMenuView;

- (void)hideMenuView;
- (void)hideMenuView:(void (^)(void))completion;

@end

