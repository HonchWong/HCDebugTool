//
//  HCBugCommitViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCBugCommitViewController.h"

@interface HCBugCommitViewController ()

@end

@implementation HCBugCommitViewController

- (instancetype)init {
    if (self = [super init]) {
        [self setupBackBtn];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupBackBtn {
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(closePage)];
    self.title = @"BugCommit";
}

- (void)closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
