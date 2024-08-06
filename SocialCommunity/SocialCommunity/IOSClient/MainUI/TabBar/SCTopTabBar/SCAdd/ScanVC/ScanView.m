//
//  ScanView.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

//static const CGFloat lineRatio = 0.9; /* 扫描线展示比例 */

#import "ScanView.h"
#import "ScanTool.h"

@interface ScanView() <UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>

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

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) UIView *videoPreView; //视频预览显示视图

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
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scannerLineView];
    [self addSubview:self.videoPreView];
    [self addSubview:self.backButton];
    [self addSubview:self.tipsLabel];
    [self addSubview:self.lightButton];
    [self addSubview:self.lightTipsLabel];
    [self addSubview:self.albumButton];
    [self addSubview:self.albumTipsLabel];
    [self startLineScanAnimation];
    [self loadScanView];
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
    [self stopLineScanAnimation];
    [self.superview removeFromSuperview];
//    [[VCManagerTool currentDisplayVC] dismissViewControllerAnimated:NO completion:nil];
}

# pragma mark - 手电筒点击事件
- (void)flashLightClick:(UIButton *)button {
    button.selected = !button.selected;
    self.lightOn = button.selected;
    if (button.selected) {
        _lightTipsLabel.text = NSLocalizedString(@"_tap_light_off", @"");
        [ScanTool openFlashLight:YES];
    }
    else {
        _lightTipsLabel.text = NSLocalizedString(@"_tap_light_on", @"");
        [ScanTool openFlashLight:NO];
    }
}

# pragma mark - 相册点击事件
- (void)albumClick:(UIButton *)button {
    [ScanTool checkAlbumAuthorization:^(BOOL isAuthorizedAlbum) {
        if (isAuthorizedAlbum) {
            [self stopLineScanAnimation];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self beginAlbumPicker];
            });
        }
    }];
}

# pragma mark - 相册跳转选择照片
- (void)beginAlbumPicker {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        imgPicker.delegate = self;
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [[VCManagerTool currentDisplayVC] presentViewController:imgPicker animated:YES completion:nil];
    }
}

/* 代理方法接收回调 */
# pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *pickerResultImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    if (!pickerResultImage) {
        [SVProgressHUD showErrorWithStatus:@"Error while getting image"];
        [picker dismissViewControllerAnimated:YES completion:^{
            [self startLineScanAnimation];
        }];
        return;
    }
    else {
        /* 测试结果使用 */
//        [self.albumButton setImage:pickerResultImage forState:UIControlStateNormal];
        NSArray *recognizeFeatures = [detector featuresInImage:[CIImage imageWithData:UIImagePNGRepresentation(pickerResultImage)]];
        [picker dismissViewControllerAnimated:YES completion:^{
            [self startLineScanAnimation];
            if (recognizeFeatures.count > 0) {
                CIQRCodeFeature *feature = recognizeFeatures[0];
                NSString *strValue = feature.messageString;
                [SVProgressHUD showInfoWithStatus:strValue];
            }
            else {
                [SVProgressHUD showErrorWithStatus:@"Invalid QRCode"];
            }
        }];
    }
}

# pragma mark - 取消选取相册图片
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        [self startLineScanAnimation];
    }];
}

/* 检测亮度接收回调 */
# pragma mark - AVCaptureVideoDataOutputSampleBufferDelegate
- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    CFDictionaryRef metadataDict = CMCopyDictionaryOfAttachments(NULL,sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    NSDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:(__bridge NSDictionary*)metadataDict];
    CFRelease(metadataDict);
    NSDictionary *exifMetadata = [[metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary] mutableCopy];
    
    // 亮度值
    float brightnessValue = [[exifMetadata objectForKey:(NSString *)kCGImagePropertyExifBrightnessValue] floatValue];
    
    if (!self.lightOn) {
        if (brightnessValue < -1.0) {
            [self showFlashLight];
        } else {
            [self hideFlashLight];
        }
    }
}

# pragma mark -- AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects && metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects[0];
        NSString *stringValue = metadataObject.stringValue;
        [SVProgressHUD showInfoWithStatus:stringValue];
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
        [_backButton setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];
        [_backButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (UIView *)videoPreView {
    if (!_videoPreView) {
        _videoPreView = [[UIView alloc] initWithFrame:self.bounds];
    }

    _videoPreView.backgroundColor = [UIColor clearColor];
    return _videoPreView;
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
        [_lightButton setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
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
        [_albumButton addTarget:self action:@selector(albumClick:) forControlEvents:UIControlEventTouchUpInside];
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
    NSLog(@"暂停动画");
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

# pragma mark - 添加扫描界面代理
- (void)loadScanView {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    AVCaptureMetadataOutput *metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    /* 设置代理 */
    [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
//    if (self.config.scannerArea == SDScannerAreaDefault) {
//
//    }
    AVCaptureVideoDataOutput *videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
    [videoDataOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([self.session canAddInput:deviceInput]) {
        [self.session addInput:deviceInput];
    }
    if ([self.session canAddOutput:metadataOutput]) {
        [self.session addOutput:metadataOutput];
    }
    if ([self.session canAddOutput:videoDataOutput]) {
        [self.session addOutput:videoDataOutput];
    }
    
    metadataOutput.metadataObjectTypes = [ScanTool metadataObjectType:self.config.scannerType];
    
    AVCaptureVideoPreviewLayer *videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    videoPreviewLayer.frame = self.layer.bounds;
    [self.videoPreView.layer insertSublayer:videoPreviewLayer atIndex:0];
    
    [self.session startRunning];
}

# pragma mark - 摄像头被遮住时展示打开闪光灯按钮
- (void)showFlashLight {
    self.lightButton.hidden = NO;
    self.lightTipsLabel.hidden = NO;
}

# pragma mark - 常规状态隐藏闪光灯
- (void)hideFlashLight {
    /* 若闪光灯为打开状态 关闭闪光灯按钮不应隐藏 */
    if (!self.lightOn) {
        self.lightButton.hidden = YES;
        self.lightTipsLabel.hidden = YES;
    }
}
@end
