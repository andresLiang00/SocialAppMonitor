//
//  VCManagerTool.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/5.
//

#import "VCManagerTool.h"

static NSTimeInterval maximumDismissTimeInterval = CGFLOAT_MAX;
static NSTimeInterval minimumDismissTimeInterval = 1.0;

@implementation VCManagerTool

+ (UIViewController *)currentDisplayVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [VCManagerTool getCurrentVCFrom:rootViewController];

    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];

    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}


+ (void)show {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD show];
}

+ (void)showWithStatus:(nullable NSString*)status {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD showWithStatus:status];
}

+ (void)dismiss {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD dismiss];
}

+ (void)showInfoWithStatus:(nullable NSString*)status {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD showInfoWithStatus:status];
    CGFloat minimum = MAX((CGFloat)status.length * 0.06 + 0.5, minimumDismissTimeInterval);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(minimum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [VCManagerTool currentDisplayVC].view.userInteractionEnabled = YES;
    });
}

+ (void)showSuccessWithStatus:(nullable NSString*)status {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD showSuccessWithStatus:status];
    CGFloat minimum = MAX((CGFloat)status.length * 0.06 + 0.5, minimumDismissTimeInterval);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(minimum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [VCManagerTool currentDisplayVC].view.userInteractionEnabled = YES;
    });
}

+ (void)showErrorWithStatus:(nullable NSString*)status {
    [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
    [SVProgressHUD showSuccessWithStatus:status];
    CGFloat minimum = MAX((CGFloat)status.length * 0.06 + 0.5, minimumDismissTimeInterval);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(minimum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [VCManagerTool currentDisplayVC].view.userInteractionEnabled = YES;
    });
}


@end
