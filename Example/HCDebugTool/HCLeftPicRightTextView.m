//
//  HCLeftPicRightTextView.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/21.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import "HCLeftPicRightTextView.h"
#import "HCLeftPicRightTextViewModelProtocol.h"

#define  CoverImgViewWidth     68
#define  CoverImgViewHeight    91

@interface HCLeftPicRightTextView ()

@property (nonatomic, strong) UIImageView *coverImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *introLabel;
@property (nonatomic, strong) UILabel *authorLabel;

@end

@implementation HCLeftPicRightTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.coverImgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.introLabel];
    [self addSubview:self.authorLabel];
}

- (void)setViewModel:(id<HCLeftPicRightTextViewModelProtocol>)viewModel {
    
}

#pragma mark - getter

- (UIImageView *)coverImgView {
    if (!_coverImgView) {
        _coverImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _coverImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] init];
        _introLabel.font = [UIFont systemFontOfSize:14];
        _introLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    }
    return _introLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.font = [UIFont systemFontOfSize:12];
        _authorLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1];
    }
    return _authorLabel;
}

@end
