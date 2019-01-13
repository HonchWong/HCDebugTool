//
//  HCNetDebugMockViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/13.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetDebugMockViewController.h"

@interface HCNetDebugMockViewController ()

@end

@implementation HCNetDebugMockViewController

- (instancetype)init {
    self = [super init];
    if (self) {
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

#pragma mark - navibar

- (void)setupBackBtn {
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(closePage)];
    self.title = @"Mock 设置";
}

- (void)closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
