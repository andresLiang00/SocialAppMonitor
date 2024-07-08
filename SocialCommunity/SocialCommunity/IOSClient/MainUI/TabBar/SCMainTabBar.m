//
//  SCMainTabBar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/5.
//

#import "SCMainTabBar.h"

@implementation SCMainTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    [self draw];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)draw {
    NSLog(@"%ld", self.items.count);
//    UITabBarItem *item = self.items[0];
//    item.title = @"Msg";
//    item.image = [UIImage imageNamed:@"icon_account"];
//    item.selectedImage = item.image;
}


@end
