//
//  SCMessage.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCMessage.h"

@interface SCMessage ()

@end

@implementation SCMessage

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"click");
    if (self.menuDelegate && [self.menuDelegate respondsToSelector:@selector(menuDismissListen:)]) {
        [self.menuDelegate menuDismissListen:self];
    }
}
@end
