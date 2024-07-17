//
//  SCMainTabBarController.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/5.
//

#import "SCMainTabBarController.h"
// tabbar样式
#import "SCTopSettingTabBar.h"
#import "SCSelectedTabbar.h"
#import "SCTabBarButton.h"
#import "SCTabBarItem.h"
/* tabbar的item部分 */
#import "SCCalendar.h"
#import "SCMessage.h"
#import "SCMessageNav.h"
#import "SCFile.h"

#define tabbarImageH 22.f

@interface SCMainTabBarController ()<SCTabbarDelegate>

@property (nonatomic, strong) SCSelectedTabbar *bottomTabbar;
@property (nonatomic, strong) SCTopSettingTabBar *topTabbar;
@property (nonatomic, assign) float systemTopHeight;
@property (nonatomic, assign) float systemTabBarHeight;
@property (nonatomic, copy) NSArray *viewControllersGroup;

// 几个子VC
@property (nonatomic, strong) SCMessage *SCMsgVC;
@property (nonatomic, strong) SCFile *SCFileVC;

@end

@implementation SCMainTabBarController

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self createVCGroup];
//        UITabBarController *systemTabbar = [[UITabBarController alloc] init];
//        NSLog(@"top:%f", safetyTop);
//        NSLog(@"tabbar:%f", systemTabbar.tabBar.frame.size.height);
//        NSLog(@"navigation:%f",self.navigationController.navigationBar.frame.size.height);
//        CGFloat tabbarheight = MAX(systemTabbar.tabBar.frame.size.height, fullWidth / 6);
//        self.systemTabBarHeight = tabbarheight + safetyBot;
//        self.bottomTabbar = [[SCSelectedTabbar alloc] initWithFrame:CGRectMake(0, fullHeight - self.systemTabBarHeight, fullWidth, self.systemTabBarHeight)];
//        self.topTabbar = [[SCSelectedTabbar alloc] initWithFrame:CGRectMake(0, 0, fullWidth, self.systemTabBarHeight)];
//        self.topTabbar.imageHeight = tabbarImageH;
//        self.bottomTabbar.tabDelegate = self;
//        self.bottomTabbar.imageHeight = tabbarImageH;
//    }
//    return self;
//}

- (void)createStyle {
    [self createVCGroup];
    UITabBarController *systemTabbar = [[UITabBarController alloc] init];
    NSLog(@"top:%f", safetyTop);
    NSLog(@"tabbar:%f", systemTabbar.tabBar.frame.size.height);
    NSLog(@"navigation:%f",self.navigationController.navigationBar.frame.size.height);
    NSLog(@"navigation:%f",self.navigationController.navigationBar.frame.size.height);
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    CGFloat tabbarheight = MAX(systemTabbar.tabBar.frame.size.height, fullWidth / 6);
    self.systemTabBarHeight = tabbarheight + safetyBot;
    self.systemTopHeight = tabbarheight;
    self.bottomTabbar = [[SCSelectedTabbar alloc] initWithFrame:CGRectMake(0, fullHeight - self.systemTabBarHeight, fullWidth, self.systemTabBarHeight)];
    self.topTabbar = [[SCTopSettingTabBar alloc] initWithFrame:CGRectMake(0, safetyTop, fullWidth, self.systemTopHeight)];
//    self.topTabbar.imageHeight = tabbarImageH;
    self.bottomTabbar.tabDelegate = self;
//    self.topTabbar.backgroundColor = [UIColor redColor];
    self.bottomTabbar.imageHeight = tabbarImageH;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createStyle];
    self.view.backgroundColor = [UIColor whiteColor];
//    SCMainTabBar *bar = [[SCMainTabBar alloc] initWithFrame:CGRectZero];
//    [self setValue:bar forKey:@"tabBar"];
    [self.view addSubview:self.topTabbar];
    [self.view addSubview:self.bottomTabbar];
    [self hideSystemTab];
    NSLog(@"minY%f", self.topTabbar.frame.origin.y);
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
    NSLog(@"%lu", (unsigned long)self.view.subviews.count);
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
    self.SCFileVC = [sb instantiateViewControllerWithIdentifier:@"SCFileNav"];
    self.viewControllersGroup = @[navi,_SCFileVC];
}


- (void)tabBar:(SCSelectedTabbar *)tabBar tabDidSelectedIndex:(NSInteger)index {
    self.selectedIndex = index;
    NSLog(@"SCMainVC index:%ld",(long)index);
    [self.topTabbar selectedViewWithTag:index];
    //    UIViewController *matchVC = [self.viewControllersGroup objectAtIndex:index];
        UINavigationController *matchVC = [self.viewControllersGroup objectAtIndex:index];
    //    matchVC.view.tag = index;
        matchVC.view.tag = 0;
        matchVC.view.frame = CGRectMake(0, 0, fullWidth, fullHeight);
        [self.view insertSubview:matchVC.view belowSubview:self.bottomTabbar];
        [self.view insertSubview:matchVC.view belowSubview:self.topTabbar];
//    [self addChildViewController:matchVC];
}
@end
