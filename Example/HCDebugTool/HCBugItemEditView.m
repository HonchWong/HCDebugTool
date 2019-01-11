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

@interface HCBugItemEditView () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) NSString *placeholderStr;

@end

@implementation HCBugItemEditView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, HCScreenWidth, [self.class viewHeight])]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UITextView *textView = [[UITextView alloc] initWithFrame:
                            CGRectMake(Margin, Margin,
                                       CGRectGetWidth(self.frame) - Margin * 2,
                                       CGRectGetHeight(self.frame) - Margin * 2)];
    textView.backgroundColor= [UIColor whiteColor];
    textView.textColor = [UIColor grayColor];
    textView.delegate = self;
    textView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    textView.layer.borderWidth = 1;
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithTitle:@"收起键盘" style:UIBarButtonItemStylePlain target:self action:@selector(hideKeyboard)];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    toolBar.items = @[closeItem];
    textView.inputAccessoryView = toolBar;
    [self addSubview:textView];
    self.textView = textView;
    self.textView.delegate = self;
}

- (void)hideKeyboard {
    [self.textView resignFirstResponder];
}

#pragma mark - UITextViewDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(editView:didEndEdit:)]) {
        [self.delegate editView:self didEndEdit:textField.text];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if(textView.text.length < 1){
        textView.text = self.placeholderStr;
        textView.textColor = [UIColor grayColor];
    }
    
    if ([self.delegate respondsToSelector:@selector(editView:didEndEdit:)]) {
        NSString *text =
        [self.placeholderStr isEqualToString:textView.text] ? @"" : textView.text;
        [self.delegate editView:self didEndEdit:text];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(editView:willBeginEdit:)]) {
        [self.delegate editView:self willBeginEdit:textView.text];
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if([textView.text isEqualToString:self.placeholderStr]){
        textView.text= @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void)setModel:(HCBugItemModel *)model {
    _model = model;
    self.placeholderStr = [NSString stringWithFormat:@"输入第 %lu 个bug描述", model.bugNumber];
    if (model.bugDesc.length) {
        self.textView.text = model.bugDesc;
        self.textView.textColor = [UIColor blackColor];
    } else {
        self.textView.text = self.placeholderStr;
        self.textView.textColor = [UIColor grayColor];
    }
}

+ (CGFloat)viewHeight {
    return 100;
}

@end
