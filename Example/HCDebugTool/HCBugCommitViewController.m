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
#import "HCBugItemEditView.h"

@interface HCBugCommitViewController () <UITableViewDelegate, UITableViewDataSource, HCBugItemEditViewDelegate>

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
    
    [self.view addSubview:self.tableView];
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
    HCBugItemEditCell *cell =
    [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HCBugItemEditCell.class)];
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.model = [self.bugBill.bugItems objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HCBugItemEditCell.class cellHeight];
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

#pragma mark - HCBugItemEditViewDelegate

- (void)editView:(HCBugItemEditView *)view
      didEndEdit:(NSString *)content {
    HCBugItemModel *item = [self.bugBill.bugItems objectAtIndex:view.tag];
    item.bugDesc = content;
}

@end
