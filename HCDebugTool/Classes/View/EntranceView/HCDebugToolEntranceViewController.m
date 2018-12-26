//
//  HCDebugToolEntranceViewController.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/17.
//

#import "HCDebugToolEntranceViewController.h"
#import "HCDebugToolUIDefine.h"
#import "HCDebugToolEntranceView.h"
#import "HCDebugToolMenuViewController.h"

@interface HCDebugToolEntranceViewController () <HCDebugToolEntranceViewActionDelegate>

@property (nonatomic, strong) HCDebugToolEntranceView *entranceView;
@property (nonatomic, strong) HCDebugToolMenuViewController *menuVC;
@property (nonatomic, weak) UINavigationController *naviVC;

@end

@implementation HCDebugToolEntranceViewController

- (instancetype)init {
    if (self = [super init]) {
        [self configProperty];
        [self setupUI];
        [self setupObserver];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Public Function

- (instancetype)initWithNaviVC:(UINavigationController *)naviVC {
    if (self = [self init]) {
        _naviVC = naviVC;
    }
    return self;
}

- (void)showEntranceView {
    self.entranceView.hidden = NO;
    [self.entranceView startAnim:5];
    if (!self.entranceView.superview) {
        [[UIApplication sharedApplication].delegate.window addSubview:self.entranceView];
    }
}

- (void)showMenuView {
    [self doEntraceAction];
}

- (void)hideMenuView {
    [self hideMenuView:nil];
}

- (void)hideMenuView:(void (^)(void))completion {
//    [self.menuVC dismissViewControllerAnimated:YES
//                                    completion:completion];
    [self.naviVC dismissViewControllerAnimated:YES
                                    completion:completion];
    self.menuVC = nil;
}

#pragma mark - HCDebugToolEntranceViewActionDelegate

- (void)doEntraceAction {
    if (self.menuVC || !self.naviVC) {
        return;
    }
    
    HCDebugToolMenuViewController *menuVC =
    [[HCDebugToolMenuViewController alloc] init];
    menuVC.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(hideMenuView)];
    menuVC.title = @"Menu";
    self.menuVC = menuVC;
    [self.naviVC setViewControllers:@[menuVC]];
    
    UIViewController *hostVC =
    [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [hostVC presentViewController:self.naviVC
                         animated:YES
                       completion:nil];
}

#pragma mark - Private Function

- (void)configProperty {
}

- (void)setupUI {
    self.entranceView = [[HCDebugToolEntranceView alloc] init];
    self.entranceView.hidden = YES;
    self.entranceView.delegate = self;
}

#pragma mark - Observer

- (void)setupObserver {
    [[UIApplication sharedApplication].delegate.window addObserver:self
                                                        forKeyPath:@"rootViewController"
                                                           options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
                                                           context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self.entranceView removeFromSuperview];
    [[UIApplication sharedApplication].delegate.window addSubview:self.entranceView];
}

@end
