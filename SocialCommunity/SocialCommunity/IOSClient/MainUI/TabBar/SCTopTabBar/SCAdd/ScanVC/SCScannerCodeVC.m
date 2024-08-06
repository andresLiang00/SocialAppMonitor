//
//  SCScannerCodeVC.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import "SCScannerCodeVC.h"
#import "ScanView.h"
#import "SCBottomView.h"
#import "ScanConfigMeta.h"


@interface SCScannerCodeVC ()

@property (nonatomic, strong) ScanView* scanView;
/* 底部菜单栏 */
@property (nonatomic, strong) SCBottomView* bottomView;

@end

@implementation SCScannerCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScanView];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupScanView {
//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scanView];
    [self.view addSubview:self.bottomView];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
}

# pragma mark -- App 从后台进入前台
- (void)appDidBecomeActive:(NSNotification *)notify {
    [self.scanView startLineScanAnimation];
}

# pragma mark -- App 从前台进入后台
- (void)appWillResignActive:(NSNotification *)notify {
    [self.scanView stopLineScanAnimation];
}

- (void)dealloc {
    _scanView = nil;
    _bottomView = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

# pragma mark - ScanView
- (ScanView *)scanView {
    if (!_scanView) {
//        _scanView = [[ScanView alloc] initWithFrame:self.view.bounds config:[[ScanConfigMeta alloc] init]];
        _scanView = [[ScanView alloc] initWithFrame:CGRectMake(0, 0, fullWidth, 0.9 * fullHeight) config:[[ScanConfigMeta alloc] init]];
    }
    
    return _scanView;
}

- (SCBottomView *)bottomView {
    if(!_bottomView) {
        _bottomView = [[SCBottomView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_scanView.frame), fullWidth, 0.1 * fullHeight)];
    }
    
    return _bottomView;
}


@end
