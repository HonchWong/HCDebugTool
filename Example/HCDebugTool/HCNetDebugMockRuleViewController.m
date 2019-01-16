//
//  HCNetDebugMockRuleViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetDebugMockRuleViewController.h"

@implementation HCNetDebugMockRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    //    [self loadData];
}

- (void)setupUI {
    self.title = @"编辑规则";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    [self.view addSubview:self.tableView];
}

@end
