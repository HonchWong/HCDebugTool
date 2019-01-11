//
//  HCBugCommitViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCBugCommitViewController.h"
#import "HCBugBillModel.h"
#import "HCUIDefine.h"
#import "HCBugItemEditCell.h"

@interface HCBugCommitViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HCBugBillModel *bugBill;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HCBugCommitViewController

- (instancetype)initWithBugBill:(HCBugBillModel *)bugBill {
    if (self = [super init]) {
        [self setupBackBtn];
        _bugBill = bugBill;
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

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return self.bugBill.bugItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HCBugItemEditCell.class)];
    return [[UITableViewCell alloc] init];
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, kNavBarHeight, HCScreenWidth, HCScreenHeight - kNavBarHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HCBugItemEditCell class]
           forCellReuseIdentifier:NSStringFromClass(HCBugItemEditCell.class)];
    }
    return _tableView;
}

@end
