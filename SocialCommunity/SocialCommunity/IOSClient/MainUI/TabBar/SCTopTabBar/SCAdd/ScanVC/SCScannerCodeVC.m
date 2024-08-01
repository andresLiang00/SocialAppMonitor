//
//  SCScannerCodeVC.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import "SCScannerCodeVC.h"
#import <AVFoundation/AVFoundation.h>

@interface SCScannerCodeVC () <AVCaptureMetadataOutputObjectsDelegate>

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
    
}

@end
