//
//  HCDebugToolEntranceView.m
//  HCDebugTool
//
//  Created by 黄鸿昌 on 2018/12/4.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolEntranceView.h"
#import "HCDebugToolUIDefine.h"

@interface HCDebugToolEntranceView ()

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, assign) NSTimeInterval firstTouchTime;
@property (nonatomic, assign) NSInteger touchCount;
@property (nonatomic, assign) CGFloat touchableMaxY;
@property (nonatomic, assign) CGFloat touchActionCount;
@property (nonatomic, assign) CGFloat touchInvaidCount;
@property (nonatomic, assign) BOOL needAnima;

@end

@implementation HCDebugToolEntranceView

- (instancetype)initWithFrame:(CGRect)frame {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = kIs_iPhoneX ? 44 : 20;
    if (self = [super initWithFrame:CGRectMake(width - 70, 0, 70, height)]) {
        [self configProperty];
        [self setupSubviews];
    }
    return self;
}

- (void)configProperty {
    self.layer.zPosition = 1.0f;
    self.backgroundColor = [UIColor darkGrayColor];
    self.touchActionCount = 3;
    self.touchableMaxY = self.frame.size.height;
}

- (void)setupSubviews {
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.tipLabel.text = @"debug";
    self.tipLabel.textColor = [UIColor blackColor];
    self.tipLabel.font = [UIFont systemFontOfSize:10];
    [self.tipLabel sizeToFit];
    [self addSubview:self.tipLabel];
}

- (void)doEntraceAction {
    self.touchCount = 0;
    
    NSTimeInterval duration = CFAbsoluteTimeGetCurrent() - self.firstTouchTime;
    if (duration > 2.0f) { return; }
    
    if ([self.delegate respondsToSelector:@selector(doEntraceAction)]) {
        [self.delegate doEntraceAction];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.touchInvaidCount != 999) {
        CGFloat touchableMaxY = 0;
        if (kIs_iPhoneX) {
            if (point.y == 45) {
                self.touchInvaidCount++;
                touchableMaxY = 45;
            }
        } else {
            if (point.y == 21) {
                self.touchInvaidCount++;
                touchableMaxY = 21;
            }
        }
        
        if (self.touchInvaidCount == 6 && touchableMaxY) {
            self.touchInvaidCount = 999;
            self.touchActionCount = 6;
            self.touchableMaxY = touchableMaxY;
        }
    }
    
    if (point.x > 0 && point.y <= self.touchableMaxY) {
        [self startAnim:0.1];
        self.touchCount++;
        if (self.touchCount == 1) {
            self.firstTouchTime = CFAbsoluteTimeGetCurrent();
        }
        if (self.touchCount == self.touchActionCount) {
            [self doEntraceAction];
        }
    }
    
    return nil;
}

- (void)startAnim:(CGFloat)duration {
    CABasicAnimation *opAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opAnim.duration = duration;
    opAnim.fromValue = [NSNumber numberWithFloat:0.7];
    opAnim.toValue = [NSNumber numberWithFloat:0];
    opAnim.cumulative = NO;
    opAnim.fillMode = kCAFillModeForwards;
    opAnim.removedOnCompletion = NO;
    [self.layer addAnimation:opAnim forKey:@"animateOpacity"];
}

@end
