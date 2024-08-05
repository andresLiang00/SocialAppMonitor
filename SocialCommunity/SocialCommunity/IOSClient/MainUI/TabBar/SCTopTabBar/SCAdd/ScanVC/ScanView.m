//
//  ScanView.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

//static const CGFloat lineRatio = 0.9; /* 扫描线展示比例 */

#import "ScanView.h"


@interface ScanView()

@property (nonatomic, strong) UIButton *backButton;  /* 返回原界面按钮 */
@property (nonatomic, strong) UIView *scannerLineView; /* 扫描线条 */
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator; /* 加载指示器 */
@property (nonatomic, strong) UIButton *lightButton;  /* 手电筒开关 */
@property (nonatomic, strong) UIButton *albumButton;  /* 相册开关 */
@property (nonatomic, strong) UILabel *lightTipsLabel;   /* 手电筒提示文字 */
@property (nonatomic, strong) UILabel *albumTipsLabel;   /* 手电筒提示文字 */
@property (nonatomic, strong) UILabel *tipsLabel;  /* 扫描器下方提示文字 */

@property (nonatomic, strong) ScanConfigMeta *config;

@property (nonatomic, assign) BOOL lightOn; //手电筒开关是否打开

@end

@implementation ScanView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame config:(ScanConfigMeta *)config {
    self = [super initWithFrame:frame];
    if (self) {
        self.config = config;
        [self createScanView];
    }
    return self;
}

- (void)createScanView {
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scannerLineView];
    [self addSubview:self.backButton];
    [self addSubview:self.tipsLabel];
    [self addSubview:self.lightButton];
    [self addSubview:self.lightTipsLabel];
    [self addSubview:self.albumButton];
    [self addSubview:self.albumTipsLabel];
    [self startLineScanAnimation];
}

# pragma mark - 重新布局
- (void)layoutSubviews {
    [super layoutSubviews];
    /* 扫描线 */
    self.scannerLineView.frame = CGRectMake(0, 0.2 * fullHeight, fullWidth, 5.0);
    
    /* 提示语 */
    self.tipsLabel.frame = CGRectMake(0, 0.7 * fullHeight, fullWidth, 20);
    
    /* 闪光灯 */
    self.lightButton.frame = CGRectMake(0, 0.6 * fullHeight, 30, 30);
    self.lightButton.center = CGPointMake(self.center.x, self.lightButton.center.y);
    
    /* 闪光灯提示语 */
    self.lightTipsLabel.frame = CGRectMake(0, CGRectGetMaxY(self.lightButton.frame) + 5, 100, 20);
    [self.lightTipsLabel sizeToFit];
    self.lightTipsLabel.center = CGPointMake(self.center.x, self.lightTipsLabel.center.y);
    
    /* 相册 */
    self.albumButton.frame = CGRectMake(fullWidth - 70, CGRectGetMaxY(self.tipsLabel.frame) + 20, 50, 50);
    
    /* 相册提示语 */
    self.albumTipsLabel.frame = CGRectMake(fullWidth - 70, CGRectGetMaxY(self.albumButton.frame) + 5, 50, 20);
    
    
}

# pragma mark - 返回按钮点击事件
- (void)clickBack:(UIButton *)button {
//    [self stopLineScanAnimation];
    [self.superview removeFromSuperview];
//    [[VCManagerTool currentDisplayVC] dismissViewControllerAnimated:NO completion:nil];
}

# pragma mark - 手电筒点击事件
- (void)flashLightClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        _lightTipsLabel.text = NSLocalizedString(@"_tap_light_off", @"");
    }
    else {
        _lightTipsLabel.text = NSLocalizedString(@"_tap_light_on", @"");
    }
}

# pragma mark - 返回按钮
- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        _backButton.frame = CGRectMake(20, 44, 20, 20);
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        _backButton.backgroundColor = [UIColor whiteColor];
        _backButton.layer.cornerRadius = 10;
        [_backButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

# pragma mark - 扫描二维码动画细线
- (UIView *)scannerLineView {
    if (!_scannerLineView) {
        _scannerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.2 * fullHeight, fullWidth, 5.0)];
        _scannerLineView.backgroundColor = [UIColor systemGreenColor];
//        _scannerLineView.layer.shadowColor = [UIColor colorWithRed:14 / 255.0 green:237 / 255.0 blue:119 / 255.0 alpha:1.0].CGColor;
        _scannerLineView.layer.shadowColor = [UIColor systemGreenColor].CGColor;
        _scannerLineView.layer.shadowOffset = CGSizeMake(0, -20);;
        _scannerLineView.layer.shadowOpacity = 1;
        _scannerLineView.layer.shadowRadius = 20;
//        _scannerLineView.layer.masksToBounds = NO;
    }
    
    return _scannerLineView;
}

# pragma mark - 二维码界面提示语
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipsLabel.text = @"识别二维码/商品/动物/花草等";
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _tipsLabel;
}

# pragma mark - 打开手电筒按钮
- (UIButton *)lightButton {
    if (!_lightButton) {
        _lightButton = [[UIButton alloc] init];
        _lightButton.frame = CGRectMake(0, 0, 30, 30);
        _lightButton.layer.cornerRadius = 15.f;
        [_lightButton setImage:[[UIImage imageNamed:@"icon_flashlight_off"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [_lightButton setImage:[[UIImage imageNamed:@"icon_flashlight_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
        _lightButton.imageView.tintColor = [UIColor whiteColor];
        [_lightButton addTarget:self action:@selector(flashLightClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _lightButton;
}

# pragma mark - 手电筒出现时提示语
- (UILabel *)lightTipsLabel {
    if (!_lightTipsLabel) {
        _lightTipsLabel = [[UILabel alloc] init];
        _lightTipsLabel.text = NSLocalizedString(@"_tap_light_on", @"");
        _lightTipsLabel.textAlignment = NSTextAlignmentCenter;
        _lightTipsLabel.textColor = [UIColor whiteColor];
        _lightTipsLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _lightTipsLabel;
}

# pragma mark - 相册按钮
- (UIButton *)albumButton {
    if (!_albumButton) {
        _albumButton = [[UIButton alloc] init];
        [_albumButton setImage:[[UIImage imageNamed:@"icon_album"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        _albumButton.imageView.tintColor = [UIColor whiteColor];
        [_albumButton setImageEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
        _albumButton.layer.cornerRadius = 25;
        [_albumButton setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.7]];
    }
    
    return _albumButton;
}

# pragma mark - 相册按钮下方文字
- (UILabel *)albumTipsLabel {
    if (!_albumTipsLabel) {
        _albumTipsLabel = [[UILabel alloc] init];
        _albumTipsLabel.text = @"相册";
        _albumTipsLabel.textAlignment = NSTextAlignmentCenter;
        _albumTipsLabel.textColor = [UIColor whiteColor];
        _albumTipsLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return _albumTipsLabel;
}

/* 动画 */
- (void)startLineScanAnimation {
    NSLog(@"开始动画");
    /* 移除已有动画*/
    [_scannerLineView.layer removeAllAnimations];
    
    CABasicAnimation *scanAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scanAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 0.5 * fullHeight , 1)];
    scanAnimation.duration = 5;
    scanAnimation.repeatCount = MAXFLOAT;
//    scanAnimation.autoreverses = YES;
    [_scannerLineView.layer addAnimation:scanAnimation forKey:@"scannerAnimation"];
    // 重置动画运行速度为1.0
     _scannerLineView.layer.speed = 2.0;
}

/* 暂停动画 */
- (void)stopLineScanAnimation {
    // 取出当前时间，转成动画暂停的时间
    CFTimeInterval pauseTime = [_scannerLineView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    // 设置动画的时间偏移量，指定时间偏移量的目的是让动画定格在该时间点的位置
    _scannerLineView.layer.timeOffset = pauseTime;
    // 将动画的运行速度设置为0， 默认的运行速度是1.0
    _scannerLineView.layer.speed = 0;
}

- (CGFloat)scannerWidth {
    return fullWidth;
}


@end
