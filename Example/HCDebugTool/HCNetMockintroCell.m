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

@property (nonatomic, strong) UILabel *urlLabel;
@property (nonatomic, strong) UITextView *urlDescTextView;
@property (nonatomic, strong) UISwitch *switchView;

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
    
    self.urlLabel.text = viewModel.url;
    self.urlDescTextView.text = viewModel.urlDesc;
}

- (void)setupUI {
    self.urlLabel.frame = CGRectMake(12, 12, HCScreenWidth - 12 - 63 - 12, self.urlLabel.font.pointSize);
    [self.contentView addSubview:self.urlLabel];
    
    self.urlDescTextView.frame = CGRectMake(12, CGRectGetMaxY(self.urlLabel.frame) + 6,
                                            CGRectGetWidth(self.urlLabel.frame),
                                            12 * 3);
    [self.contentView addSubview:self.urlDescTextView];
    
    self.switchView.frame = CGRectMake(CGRectGetMaxX(self.urlDescTextView.frame) + 12,
                                       12, 0, 0);
    [self.contentView addSubview:self.switchView];
}

+ (CGFloat)cellHeight {
    return 12 * 3 + 6 + 12 * 2 + 14;
}

#pragma mark - action

- (void)switchViewDidTap:(UISwitch *)sender {
//    if ([self.delegate respondsToSelector:@selector(optionItem:didChangeSwitch:)]) {
//        [self.delegate optionItem:self.viewModel didChangeSwitch:sender.isOn];
//    }
}

#pragma mark - getter

- (UILabel *)urlLabel {
    if (!_urlLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 1;
        _urlLabel = label;
    }
    return _urlLabel;
}

- (UITextView *)urlDescTextView {
    if (!_urlDescTextView) {
        _urlDescTextView = [[UITextView alloc] init];
        _urlDescTextView.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        _urlDescTextView.font = [UIFont systemFontOfSize:12];
        _urlDescTextView.editable = NO;
        _urlDescTextView.layer.borderWidth = 1;
        _urlDescTextView.layer.borderColor = [UIColor colorWithWhite:0.7 alpha:1.0].CGColor;
    }
    return _urlDescTextView;
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


@end
