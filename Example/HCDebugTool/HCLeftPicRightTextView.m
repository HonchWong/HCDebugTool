//
//  HCLeftPicRightTextView.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2018/12/21.
//  Copyright © 2018年 honchwong404@gmail.com. All rights reserved.
//

#import "HCLeftPicRightTextView.h"
#import "HCLeftPicRightTextViewModelProtocol.h"
#import "UIView+FBLayout.h"
#import "HCUIDefine.h"
#import "FBLayoutDiv.h"

#define  CoverImgViewWidth     68
#define  CoverImgViewHeight    91
#define  CoverImgViewMargin    16

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
        [self makeLayout];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.coverImgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.introLabel];
    [self addSubview:self.authorLabel];
}

- (void)makeLayout {
    [self.coverImgView fb_makeLayout:^(FBLayout *layout) {
        layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(CoverImgViewMargin, CoverImgViewMargin, CoverImgViewMargin, 0)).wrapContent();
        layout.height.equalTo(@(CoverImgViewHeight));
        layout.width.equalTo(@(CoverImgViewWidth));
    }];
    
    [self.titleLabel fb_makeLayout:^(FBLayout *layout) {
        layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(CoverImgViewMargin, CoverImgViewMargin, 0, CoverImgViewMargin)).wrapContent();
        layout.height.equalTo(@(self.titleLabel.font.pointSize));
    }];
    
    [self.introLabel fb_makeLayout:^(FBLayout *layout) {
        layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(CoverImgViewMargin, CoverImgViewMargin, 0, CoverImgViewMargin)).wrapContent();
    }];
    
    [self.authorLabel fb_makeLayout:^(FBLayout *layout) {
        layout.margin.equalToEdgeInsets(UIEdgeInsetsMake(CoverImgViewMargin + CoverImgViewHeight - self.authorLabel.font.pointSize, CoverImgViewMargin, CoverImgViewMargin, 0)).wrapContent();
        layout.height.equalTo(@(self.authorLabel.font.pointSize));
        layout.positionType = FBPositionTypeAbsolute;
    }];

    FBLayoutDiv *div =[FBLayoutDiv layoutDivWithFlexDirection:FBFlexDirectionColumn
                                               justifyContent:FBJustifySpaceBetween
                                                   alignItems:FBAlignFlexStart
                                                     children:@[self.titleLabel, self.introLabel, self.authorLabel]];
    [div fb_makeLayout:^(FBLayout *layout) {
        layout.width.equalTo(@(HCScreenWidth - CoverImgViewWidth - CoverImgViewMargin));
    }];
    
    [self fb_makeLayout:^(FBLayout *layout) {
        layout.width.equalTo(@(HCScreenWidth));
        layout.height.equalTo(@(CoverImgViewHeight + CoverImgViewMargin * 2));
        layout.flexDirection.equalTo(@(FBFlexDirectionRow));
        layout.alignItems.equalTo(@(FBAlignFlexStart));
        layout.justifyContent.equalTo(@(FBJustifyFlexStart));
    }];
    self.fb_children = @[self.coverImgView, div];
}

- (void)setViewModel:(id<HCLeftPicRightTextViewModelProtocol>)viewModel {
    self.titleLabel.text = viewModel.title;
    self.introLabel.text = viewModel.intro;
    self.authorLabel.text = viewModel.author;
    self.coverImgView.image = [UIImage imageNamed:[viewModel cover]];
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
        _introLabel.numberOfLines = 2;
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
