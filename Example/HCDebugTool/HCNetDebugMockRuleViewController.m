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
@property (nonatomic, strong) NSArray <HCNetMockRuleSectionModel *>*sectionModels;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

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
    
    [self loadData];
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

- (void)loadData {
    self.sectionModels = [self.manager sectionModelWithMockIdentity:self.ruleIdentity];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sectionModels objectAtIndex:section].items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HCNetMockRuleCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"HCNetMockRuleCell"];
    }
    
    HCNetMockRuleItemModel *item = [[self.sectionModels objectAtIndex:indexPath.section].items objectAtIndex:indexPath.row];
    cell.textLabel.text = item.ruleName;
    cell.detailTextLabel.text = item.enable ? @"已选中" : @"未选中";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.frame = CGRectMake(0, 0, 22 + 10, 22);
    [button addTarget:self
               action:@selector(editRule)
     forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = button;
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    if (item.enable) {
        self.selectedIndexPath = indexPath;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.sectionModels objectAtIndex:section] title];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    HCNetMockRuleItemModel *item = [[self.sectionModels objectAtIndex:indexPath.section].items objectAtIndex:indexPath.row];
    item.enable = !item.enable;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = item.enable ? @"已选中" : @"未选中";
    
    HCNetMockRuleInfoModel *ruleInfo = [[HCNetMockRuleInfoModel alloc] init];
    ruleInfo.rule = item;
    [self.manager saveRule:ruleInfo withMockIdentity:self.ruleIdentity];
        
    if (item.enable && ![self.selectedIndexPath isEqual:indexPath]) {
        cell = [tableView cellForRowAtIndexPath:self.selectedIndexPath];
        cell.detailTextLabel.text = @"未选中";
        item = [[self.sectionModels objectAtIndex:self.selectedIndexPath.section].items objectAtIndex:self.selectedIndexPath.row];
        item.enable = NO;
        
        self.selectedIndexPath = indexPath;
    }
}

#pragma mark - action

- (void)saveResult {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)editRule {
    
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect frame = CGRectMake(0, kNavBarHeight,
                                  self.view.bounds.size.width,
                                  self.view.bounds.size.height - kNavBarHeight);
        _tableView =
        [[UITableView alloc] initWithFrame:frame
                                     style:UITableViewStyleGrouped];
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
