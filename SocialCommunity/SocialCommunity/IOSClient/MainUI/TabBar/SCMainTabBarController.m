//
//  SCMainTabBarController.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/5.
//

#import "SCMainTabBarController.h"
#define tabbarImageH 22.f

@interface SCMainTabBarController ()

@property (nonatomic, strong) SelectedTabbar *bottomTabbar;
@property (nonatomic, assign) float systemTabBarHeight;

@end

@implementation SCMainTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITabBarController *systemTabbar = [[UITabBarController alloc] init];
        CGFloat tabbarheight = MAX(systemTabbar.tabBar.frame.size.height, fullWidth / 6);
        self.systemTabBarHeight = tabbarheight + safetyBot;
//        UIImage *settingSelect = [[UIImage imageNamed:@"icon_daily"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        NSLog(@"width:%f",settingSelect.size.width);
//        NSLog(@"height:%f",settingSelect.size.height);
//        NSLog(@"left:%f",tabBarItem.imageInsets.left);
//        NSLog(@"top:%f",tabBarItem.imageInsets.top);
//        NSLog(@"right:%f",tabBarItem.imageInsets.right);
//        NSLog(@"bottom:%f",tabBarItem.imageInsets.bottom);
//        NSLog(@"height:%f",systemTabbar.tabBar.frame.size.height);
        self.bottomTabbar = [[SelectedTabbar alloc] initWithFrame:CGRectMake(0, fullHeight - self.systemTabBarHeight, fullWidth, self.systemTabBarHeight)];
        self.bottomTabbar.imageHeight = tabbarImageH;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    SCMainTabBar *bar = [[SCMainTabBar alloc] initWithFrame:CGRectZero];
//    [self setValue:bar forKey:@"tabBar"];
    [self.view addSubview:self.bottomTabbar];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
