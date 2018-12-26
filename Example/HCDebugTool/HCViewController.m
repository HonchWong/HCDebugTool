//
//  HCViewController.m
//  HCDebugTool
//
//  Created by honchwong404@gmail.com on 12/07/2018.
//  Copyright (c) 2018 honchwong404@gmail.com. All rights reserved.
//

#import "HCViewController.h"
#import <HCDebugTool/HCDebugTool.h>

@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((width - 100) * 0.5,
                                                               (height - 100) * 0.5,
                                                               100, 100)];
    label.text = @"点击电池三下\n查看我的工具箱";
    label.numberOfLines = 2;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
