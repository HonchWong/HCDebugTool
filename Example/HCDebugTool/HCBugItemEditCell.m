//
//  HCBugItemEditCell.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCBugItemEditCell.h"
#import "HCBugItemEditView.h"

@interface HCBugItemEditCell ()

@property (nonatomic, strong) HCBugItemEditView *cardView;

@end

@implementation HCBugItemEditCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor whiteColor];

    self.cardView = [[HCBugItemEditView alloc] init];
    [self.contentView addSubview:self.cardView];
}

- (void)setTag:(NSInteger)tag {
    self.cardView.tag = tag;
}

- (void)setDelegate:(id<HCBugItemEditViewDelegate>)delegate {
    [self.cardView setDelegate:delegate];
}

@end
