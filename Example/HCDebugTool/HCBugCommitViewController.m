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
@property (nonatomic, assign) CGPoint startContentOffset;
@property (nonatomic, assign) CGFloat keyboardAnimDuration;
@property (nonatomic, assign) NSInteger currentEditIndex;
@property (nonatomic, assign) BOOL keyboardDidShow;
@property (nonatomic, strong) UIButton *commitBtn;

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
    [self setupObserver];
}

- (void)setupObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    if (self.bugBill.bugPicture) {
        UIImageView *bugPicture = [[UIImageView alloc] initWithImage:self.bugBill.bugPicture];
        bugPicture.frame = CGRectMake(0, 0, HCScreenWidth, HCScreenHeight * 0.5);
        bugPicture.contentMode = UIViewContentModeScaleAspectFit;
        self.tableView.tableHeaderView = bugPicture;
    }
    
    self.tableView.tableFooterView = self.commitBtn;
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

- (void)commitBtnAction {
//    [self.commitBtn setSelected:YES];
//    self.commitBtn.userInteractionEnabled = NO;
    
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return self.bugBill.bugItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HCBugItemEditCell *cell =
    [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HCBugItemEditCell.class)
                                    forIndexPath:indexPath];
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.model = [self.bugBill.bugItems objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HCBugItemEditCell.class cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}



#pragma mark - HCBugItemEditViewDelegate

- (void)editView:(HCBugItemEditView *)view
      didEndEdit:(NSString *)content {
    HCBugItemModel *item = [self.bugBill.bugItems objectAtIndex:view.tag];
    item.bugDesc = content;
}

- (void)editView:(HCBugItemEditView *)view willBeginEdit:(NSString *)content {
    self.currentEditIndex = view.tag;
}

#pragma mark - keyboard

- (void)keyboardWillShow:(NSNotification *)note {
    CGRect keyBoardRect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height, 0);
}

- (void)keyboardWillHide:(NSNotification *)note {
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.keyboardDidShow = NO;
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

- (UIButton *)commitBtn {
    if (!_commitBtn) {
        UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commitBtn setTitle:@"提交bug" forState:UIControlStateNormal];
        [commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [commitBtn setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateSelected];
        [commitBtn addTarget:self
                      action:@selector(commitBtnAction)
            forControlEvents:UIControlEventTouchUpInside];
        commitBtn.frame = CGRectMake(0, 0, HCScreenWidth, 64);
        [commitBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [commitBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
        commitBtn.layer.borderWidth = 2;
        commitBtn.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        _commitBtn = commitBtn;
    }
    return _commitBtn;
}
@end
