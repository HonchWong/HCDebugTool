//
//  HCNetMockintroCell.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/15.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCNetMockintroCell.h"
#import "HCUIDefine.h"

@interface HCNetMockintroCell ()

@property (nonatomic, strong) UILabel *urlDescLabel;
@property (nonatomic, strong) UITextView *urlDetailTextView;
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UIButton *editButton;

@end

@implementation HCNetMockintroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setViewModel:(HCNetMockIntroViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.urlDescLabel.text = viewModel.urlDesc;
    self.urlDetailTextView.text = viewModel.urlDetail;
}

- (void)setupUI {
    self.urlDescLabel.frame = CGRectMake(12, 12, HCScreenWidth - 12 - 70 - 12, self.urlDescLabel.font.pointSize);
    [self.contentView addSubview:self.urlDescLabel];
    
    self.urlDetailTextView.frame = CGRectMake(12, CGRectGetMaxY(self.urlDescLabel.frame) + 6,
                                            CGRectGetWidth(self.urlDescLabel.frame),
                                            12 * 3);
    [self.contentView addSubview:self.urlDetailTextView];
    
    self.switchView.frame = CGRectMake(CGRectGetMaxX(self.urlDetailTextView.frame) + 12,
                                       12, 0, 0);
    [self.contentView addSubview:self.switchView];
    
    self.editButton.frame = CGRectMake(CGRectGetMinX(self.switchView.frame),
                                       CGRectGetMaxY(self.switchView.frame) + 8,
                                       CGRectGetWidth(self.switchView.frame),
                                       18);
    self.editButton.layer.cornerRadius = 3;
    
    [self.contentView addSubview:self.editButton];
}

+ (CGFloat)cellHeight {
    return 12 * 3 + 6 + 12 * 2 + 14;
}

#pragma mark - action

- (void)switchViewDidTap:(UISwitch *)sender {
    if ([self.delegate respondsToSelector:@selector(cell:switchViewDidTap:)]) {
        [self.delegate cell:self switchViewDidTap:sender.isOn];
    }
}

- (void)editRule {
    if ([self.delegate respondsToSelector:@selector(cellEditRuleBtnDidClick:)]) {
        [self.delegate cellEditRuleBtnDidClick:self];
    }
}

#pragma mark - getter

- (UILabel *)urlDescLabel {
    if (!_urlDescLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 1;
        _urlDescLabel = label;
    }
    return _urlDescLabel;
}

- (UITextView *)urlDetailTextView {
    if (!_urlDetailTextView) {
        _urlDetailTextView = [[UITextView alloc] init];
        _urlDetailTextView.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        _urlDetailTextView.font = [UIFont systemFontOfSize:12];
        _urlDetailTextView.editable = NO;
        _urlDetailTextView.layer.borderWidth = 1;
        _urlDetailTextView.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:1.0].CGColor;
    }
    return _urlDetailTextView;
}

- (UISwitch *)switchView {
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self
                        action:@selector(switchViewDidTap:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchView;
}

- (UIButton *)editButton {
    if (!_editButton) {
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editButton setTitle:@"编辑规则" forState:UIControlStateNormal];
        [_editButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_editButton.titleLabel setFont:[UIFont systemFontOfSize:8]];
        _editButton.layer.borderColor = [UIColor blueColor].CGColor;
        _editButton.layer.borderWidth = 1;
        [_editButton setBackgroundColor:[UIColor whiteColor]];
        [_editButton addTarget:self action:@selector(editRule) forControlEvents:UIControlEventTouchUpInside];
        _editButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _editButton;
}

@end
