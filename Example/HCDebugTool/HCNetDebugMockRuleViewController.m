//
//  HCNetDebugMockRuleViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/16.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetDebugMockRuleViewController.h"
#import "HCUIDefine.h"
#import "HCNetMockManager.h"

@interface HCNetDebugMockRuleViewController () <
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *ruleIdentity;
@property (nonatomic, strong) HCNetMockManager *manager;
@property (nonatomic, strong) HCNetMockRuleInfoModel *ruleInfo;

@end

@implementation HCNetDebugMockRuleViewController

- (instancetype)initWithRuleIdentity:(NSString *)identity {
    if (self = [super init]) {
        self.ruleIdentity = identity;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
//    [self loadData];
}

- (void)setupUI {
    self.title = @"编辑规则";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                  target:self
                                                  action:@selector(saveResult)];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Data

- (void)loadData {
    self.ruleInfo = [self.manager ruleInfoWithMockIdentity:self.ruleIdentity];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ruleInfo.rules.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [HCNetMockintroCell cellHeight];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    HCNetMockintroCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HCNetMockintroCell class])];
//    if (!cell) {
//        cell = [[HCNetMockintroCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                         reuseIdentifier:NSStringFromClass([HCNetMockintroCell class])];
//    }
//    [cell setViewModel:[self.viewModels objectAtIndex:indexPath.row]];
//    cell.delegate = self;
//
//    return cell;
//}

#pragma mark - action

- (void)saveResult {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, kNavBarHeight,
                                  self.view.bounds.size.width,
                                  self.view.bounds.size.height - kNavBarHeight);
        _tableView =
        [[UITableView alloc] initWithFrame:frame
                                     style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (HCNetMockManager *)manager {
    if (!_manager) {
        _manager = [[HCNetMockManager alloc] init];
    }
    return _manager;
}

@end
