//
//  MenuView.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/22.
//

#import "MenuView.h"

@implementation MenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLayout];
    }
    return self;
}

// 配置CollectionVew的参数
- (void)createLayout {
    
}

@end
