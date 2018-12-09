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
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) HCDebugToolCommonOptionItemViewModel *viewModel;

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
    
    self.switchView = [[UISwitch alloc] init];
    [self.switchView addTarget:self
                        action:@selector(switchViewDidTap:)
              forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.switchView];
    self.switchView.hidden = YES;
}

- (void)setViewModel:(HCDebugToolCommonOptionItemViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.label.text = viewModel.title;
    self.tag = viewModel.viewTag;
    
    if (viewModel.hasSwich) {
        self.switchView.hidden = NO;
        [self.switchView setOn:viewModel.isSwichOn];
    } else {
        self.switchView.hidden = YES;
    }
    
    [self updateContentFrame];
}

- (void)updateContentFrame {
    if (self.switchView.hidden) {
        self.label.frame = self.bounds;
    } else {
        CGFloat containerH = CGRectGetHeight(self.bounds);
        CGFloat containerW = CGRectGetWidth(self.bounds);
        CGFloat switchW = CGRectGetWidth(self.switchView.frame);
        CGFloat switchH = CGRectGetHeight(self.switchView.frame);
        CGFloat switchY = containerH - switchH - 5;
        CGFloat switchX = (containerW - switchW) * 0.5;
        self.switchView.frame = CGRectMake(switchX, switchY, switchW, switchH);
        
        self.label.frame = CGRectMake(0, 0, containerW, switchY - 3);
    }
}

- (void)switchViewDidTap:(UISwitch *)sender {
    if ([self.delegate respondsToSelector:@selector(optionItem:didChangeSwitch:)]) {
        [self.delegate optionItem:self.viewModel didChangeSwitch:sender.state];
    }
}

@end
