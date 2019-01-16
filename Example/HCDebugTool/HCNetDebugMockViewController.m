//
//  HCNetDebugMockViewController.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/13.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetDebugMockViewController.h"
#import "HCNetMockintroCell.h"
#import "HCUIDefine.h"
#import "HCNetMockDataManager.h"

@interface HCNetDebugMockViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <HCNetMockIntroViewModel *>*viewModels;

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
    
    [self loadData];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
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

#pragma mark - Data

- (void)loadData {
    [HCNetMockDataManager requestIntroViewModelWithCompletionHandler:^(BOOL success, NSArray<HCNetMockIntroViewModel *> *viewModels) {
        [self.viewModels addObjectsFromArray:viewModels];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HCNetMockintroCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HCNetMockintroCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HCNetMockintroCell class])];
    if (!cell) {
        cell = [[HCNetMockintroCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:NSStringFromClass([HCNetMockintroCell class])];
    }
    [cell setViewModel:[self.viewModels objectAtIndex:indexPath.row]];
    
    return cell;
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

- (NSMutableArray<HCNetMockIntroViewModel *> *)viewModels {
    if (!_viewModels) {
        _viewModels = @[].mutableCopy;
    }
    return _viewModels;
}

@end
