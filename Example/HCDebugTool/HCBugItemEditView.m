//
//  HCBugItemEditView.m
//  HCDebugTool_Example
//
//  Created by 黄鸿昌 on 2019/1/10.
//  Copyright © 2019 honchwong404@gmail.com. All rights reserved.
//

#import "HCBugItemEditView.h"
#import "HCUIDefine.h"
#import "HCBugItemModel.h"

#define Margin  16

@interface HCBugItemEditView () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation HCBugItemEditView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, HCScreenWidth, [self.class viewHeight])]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.textField = [[UITextField alloc] initWithFrame:
                      CGRectMake(Margin, Margin,
                                 CGRectGetWidth(self.frame) - Margin * 2,
                                 CGRectGetHeight(self.frame) - Margin * 2)];
    [self addSubview:self.textField];
    self.textField.delegate = self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.textField.placeholder = placeholder;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(editView:didEndEdit:)]) {
        [self.delegate editView:self didEndEdit:textField.text];
    }
}

- (void)setModel:(HCBugItemModel *)model {
    _model = model;
    self.textField.placeholder = [NSString stringWithFormat:@"第 %lu 个bug", model.bugNumber];
    self.textField.text = model.bugDesc;
}

- (NSString *)content {
    return self.textField.text;
}

+ (CGFloat)viewHeight {
    return 100;
}

@end
