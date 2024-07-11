//
//  SCMainTabBarController.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/5.
//

#import "SCMainTabBarController.h"
#define tabbarImageH 22.f

@interface SCMainTabBarController ()<SCTabbarDelegate>

@property (nonatomic, strong) SCSelectedTabbar *bottomTabbar;
@property (nonatomic, strong) SCSelectedTabbar *topTabbar;
@property (nonatomic, assign) float systemTabBarHeight;
@property (nonatomic, copy) NSArray *viewControllersGroup;

// 几个子VC
@property (nonatomic, strong) SCMessage *SCMsgVC;


@end

@implementation SCMainTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createVCGroup];
        UITabBarController *systemTabbar = [[UITabBarController alloc] init];
        CGFloat tabbarheight = MAX(systemTabbar.tabBar.frame.size.height, fullWidth / 6);
        self.systemTabBarHeight = tabbarheight + safetyBot;
        self.bottomTabbar = [[SCSelectedTabbar alloc] initWithFrame:CGRectMake(0, fullHeight - self.systemTabBarHeight, fullWidth, self.systemTabBarHeight)];
        self.topTabbar = [[SCSelectedTabbar alloc] initWithFrame:CGRectMake(0, 0, fullWidth, self.systemTabBarHeight)];
        self.topTabbar.imageHeight = tabbarImageH;
        self.bottomTabbar.tabDelegate = self;
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
    [self.view addSubview:self.topTabbar];
    [self.view addSubview:self.bottomTabbar];
    [self hideSystemTab];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)hideSystemTab {
//    NSLog(@"%lu", (unsigned long)self.view.subviews.count);
    for (UIView *sub in self.view.subviews) {
        Class class = NSClassFromString(@"UITabBar");
        if ([sub isKindOfClass:class]) {
            sub.hidden = YES;
        }
    }
}

- (void)createVCGroup {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SCMainUIGuide" bundle:nil];
    SCMessageNav *navi = [sb instantiateViewControllerWithIdentifier:@"SCMessageNav"];
    self.viewControllersGroup = @[navi];
}


- (void)tabBar:(SCSelectedTabbar *)tabBar tabDidSelectedIndex:(NSInteger)index {
    self.selectedIndex = index;
    NSLog(@"SCMainVC index:%ld",(long)index);
//    UIViewController *matchVC = [self.viewControllersGroup objectAtIndex:index];
    UINavigationController *matchVC = [self.viewControllersGroup objectAtIndex:0];
//    matchVC.view.tag = index;
    matchVC.view.tag = 0;
    matchVC.view.frame = CGRectMake(0, 0, fullWidth, fullHeight);
    [self.view insertSubview:matchVC.view belowSubview:self.bottomTabbar];
    [self.view insertSubview:matchVC.view belowSubview:self.topTabbar];
    [self addChildViewController:matchVC];
}
@end
