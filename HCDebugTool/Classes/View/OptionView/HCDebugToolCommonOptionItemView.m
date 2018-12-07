//
//  HCDebugToolCommonOptionItemView.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/6.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolCommonOptionItemView.h"

@interface HCDebugToolCommonOptionItemView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation HCDebugToolCommonOptionItemView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configProperty];
        [self setupSubviews];
    }
    return self;
}

- (void)configProperty {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 6;
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)setupSubviews {
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    [self addSubview:self.label];
}

- (void)layoutSubviews {
    self.label.frame = self.bounds;
}

- (void)setViewModel:(HCDebugToolCommonOptionItemViewModel *)viewModel {
    self.label.text = viewModel.title;
    self.tag = viewModel.viewTag;
}

@end
