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

- (void)showEntranceView {
    self.entranceView.hidden = NO;
    [self.entranceView startAnim:5];
}

- (void)showMenuView {
    [self doEntraceAction];
}

- (void)hideMenuView {
    [self hideMenuView:nil];
}

- (void)hideMenuView:(void (^)(void))completion {
    [self.menuVC dismissViewControllerAnimated:YES
                                    completion:completion];
}

#pragma mark - HCDebugToolEntranceViewActionDelegate

- (void)doEntraceAction {
    if (self.menuVC) {
        return;
    }
    
    HCDebugToolMenuViewController *menuVC =
    [[HCDebugToolMenuViewController alloc] init];
    menuVC.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(hideMenuView)];
    menuVC.title = @"DebugTool Menu";
    self.menuVC = menuVC;
    UINavigationController *wrapperNavigationController =
    [[UINavigationController alloc] initWithRootViewController:menuVC];
    
    UIViewController *hostVC =
    [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [hostVC presentViewController:wrapperNavigationController
                         animated:YES
                       completion:nil];
}

#pragma mark - Private Function

- (void)configProperty {
}

- (void)setupUI {
    self.entranceView = [[HCDebugToolEntranceView alloc] init];
    self.entranceView.hidden = YES;
    [[UIApplication sharedApplication].delegate.window addSubview:self.entranceView];
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
