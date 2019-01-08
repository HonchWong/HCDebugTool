//
//  DoraemonViewAlignView.m
//  DoraemonKit-DoraemonKit
//
//  Created by yixiang on 2018/6/16.
//

#import "DoraemonViewAlignView.h"
#import "HCUIDefine.h"
#import "DoraemonVisualInfoWindow.h"
#import "UIColor+Doraemon.h"

static CGFloat const kViewCheckSize = 30;

@interface DoraemonViewAlignView()

@property (nonatomic, strong) UIView *panView;
@property (nonatomic, strong) UIView *horizontalLine;//水平线
@property (nonatomic, strong) UIView *verticalLine;//垂直线
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) DoraemonVisualInfoWindow *infoWindow;
@property (nonatomic, strong) UILabel *infoLbl;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation DoraemonViewAlignView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, DoraemonScreenWidth, DoraemonScreenHeight);
        self.backgroundColor = [UIColor clearColor];
        self.layer.zPosition = FLT_MAX;
        //self.userInteractionEnabled = NO;
        
        UIView *panView = [[UIView alloc] initWithFrame:CGRectMake(DoraemonScreenWidth/2-kViewCheckSize/2, DoraemonScreenHeight/2-kViewCheckSize/2, kViewCheckSize, kViewCheckSize)];
        panView.layer.cornerRadius = kViewCheckSize * 0.5;
        panView.layer.masksToBounds = YES;
        panView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
        [self addSubview:panView];
        _panView = panView;


        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [panView addGestureRecognizer:pan];
        
        _horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, panView.center.y-0.25, self.frame.size.width, 0.5)];
        _horizontalLine.backgroundColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        [self addSubview:_horizontalLine];
        
        _verticalLine = [[UIView alloc] initWithFrame:CGRectMake(panView.center.x-0.25, 0, 0.5, self.frame.size.height)];
        _verticalLine.backgroundColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        [self addSubview:_verticalLine];
        
        [self bringSubviewToFront:_panView];
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.font = [UIFont systemFontOfSize:12];
        _leftLabel.textColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        _leftLabel.text = [NSString stringWithFormat:@"%.1f",panView.center.x];
        [self addSubview:_leftLabel];
        [_leftLabel sizeToFit];
        _leftLabel.frame = CGRectMake(panView.center.x/2, panView.center.y-_leftLabel.frame.size.height, _leftLabel.frame.size.width, _leftLabel.frame.size.height);
        
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont systemFontOfSize:12];
        _topLabel.textColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        _topLabel.text = [NSString stringWithFormat:@"%.1f",panView.center.y];
        [self addSubview:_topLabel];
        [_topLabel sizeToFit];
        _topLabel.frame = CGRectMake(panView.center.x-_topLabel.frame.size.width, panView.center.y/2, _topLabel.frame.size.width, _topLabel.frame.size.height);
        
        _rightLabel = [[UILabel alloc] init];
        _rightLabel.font = [UIFont systemFontOfSize:12];
        _rightLabel.textColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        _rightLabel.text = [NSString stringWithFormat:@"%.1f",self.frame.size.width-panView.center.x];
        [self addSubview:_rightLabel];
        [_rightLabel sizeToFit];
        _rightLabel.frame = CGRectMake(panView.center.x+(self.frame.size.width-panView.center.x)/2, panView.center.y-_rightLabel.frame.size.height, _rightLabel.frame.size.width, _rightLabel.frame.size.height);
        
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.font = [UIFont systemFontOfSize:12];
        _bottomLabel.textColor = [UIColor doraemon_colorWithHexString:@"#666666"];
        _bottomLabel.text = [NSString stringWithFormat:@"%.1f",self.frame.size.height - panView.center.y];
        [self addSubview:_bottomLabel];
        [_bottomLabel sizeToFit];
        _bottomLabel.frame = CGRectMake(panView.center.x-_bottomLabel.frame.size.width, panView.center.y+(self.frame.size.height - panView.center.y)/2, _bottomLabel.frame.size.width, _bottomLabel.frame.size.height);
        
        _infoWindow = [[DoraemonVisualInfoWindow alloc] initWithFrame:CGRectMake(kDoraemonSizeFrom750(30), DoraemonScreenHeight - kDoraemonSizeFrom750(100) - kDoraemonSizeFrom750(30), DoraemonScreenWidth - 2*kDoraemonSizeFrom750(30), kDoraemonSizeFrom750(100))];
        
        CGFloat closeWidth = kDoraemonSizeFrom750(44);
        CGFloat closeHeight = kDoraemonSizeFrom750(44);
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(_infoWindow.bounds.size.width - closeWidth - kDoraemonSizeFrom750(32), (_infoWindow.bounds.size.height - closeHeight) / 2.0, closeWidth, closeHeight)];
        [_closeBtn setTitle:@"关" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_closeBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [_closeBtn addTarget:self action:@selector(closeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_infoWindow addSubview:_closeBtn];
        
        _infoLbl = [[UILabel alloc] initWithFrame:CGRectMake(kDoraemonSizeFrom750(32), 0, _infoWindow.bounds.size.width - 2*kDoraemonSizeFrom750(32) - _closeBtn.frame.size.width , _infoWindow.bounds.size.height)];
        _infoLbl.backgroundColor =[UIColor clearColor];
        _infoLbl.textColor = [UIColor doraemon_black_1];
        _infoLbl.font = [UIFont systemFontOfSize:kDoraemonSizeFrom750(24)];
        [self configInfoLblText];
        [_infoWindow addSubview:_infoLbl];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)sender{
    //1、获得拖动位移
    CGPoint offsetPoint = [sender translationInView:sender.view];
    //2、清空拖动位移
    [sender setTranslation:CGPointZero inView:sender.view];
    //3、重新设置控件位置
    UIView *panView = sender.view;
    CGFloat newX = panView.center.x+offsetPoint.x;
    CGFloat newY = panView.center.y+offsetPoint.y;

    CGPoint centerPoint = CGPointMake(newX, newY);
    panView.center = centerPoint;
    
    _horizontalLine.frame = CGRectMake(0, _panView.center.y-0.25, self.frame.size.width, 0.5);
    _verticalLine.frame = CGRectMake(_panView.center.x-0.25, 0, 0.5, self.frame.size.height);
    
    _leftLabel.text = [NSString stringWithFormat:@"%.1f",_panView.center.x];
    [_leftLabel sizeToFit];
    _leftLabel.frame = CGRectMake(_panView.center.x/2, _panView.center.y-_leftLabel.frame.size.height, _leftLabel.frame.size.width, _leftLabel.frame.size.height);
    
    _topLabel.text = [NSString stringWithFormat:@"%.1f",_panView.center.y];
    [_topLabel sizeToFit];
    _topLabel.frame = CGRectMake(_panView.center.x-_topLabel.frame.size.width, _panView.center.y/2, _topLabel.frame.size.width, _topLabel.frame.size.height);
    
    _rightLabel.text = [NSString stringWithFormat:@"%.1f",self.frame.size.width-_panView.center.x];
    [_rightLabel sizeToFit];
    _rightLabel.frame = CGRectMake(_panView.center.x+(self.frame.size.width-_panView.center.x)/2, _panView.center.y-_rightLabel.frame.size.height, _rightLabel.frame.size.width, _rightLabel.frame.size.height);
    
    _bottomLabel.text = [NSString stringWithFormat:@"%.1f",self.frame.size.height - _panView.center.y];
    [_bottomLabel sizeToFit];
    _bottomLabel.frame = CGRectMake(_panView.center.x-_bottomLabel.frame.size.width, _panView.center.y+(self.frame.size.height - _panView.center.y)/2, _bottomLabel.frame.size.width, _bottomLabel.frame.size.height);
    
    [self configInfoLblText];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if(CGRectContainsPoint(_panView.frame, point)){
        return YES;
    }
    return NO;
}

- (void)configInfoLblText {
    _infoLbl.text = [NSString stringWithFormat:@"位置：左%@  右%@  上%@  下%@", _leftLabel.text, _rightLabel.text, _topLabel.text, _bottomLabel.text];
}

- (void)closeBtnClicked:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:DoraemonClosePluginNotification object:nil userInfo:nil];

}

- (void)show {
    _infoWindow.hidden = NO;
    self.hidden = NO;
}

- (void)hide {
    _infoWindow.hidden = YES;
    self.hidden = YES;
}

@end
