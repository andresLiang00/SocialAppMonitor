//
//  SCMainTabBarController.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/5.
//

#import "SCMainTabBarController.h"

@interface SCMainTabBarController ()

@end

@implementation SCMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setValue:[[SCMainTabBar alloc] init] forKey:@"tabBar"];
    
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
