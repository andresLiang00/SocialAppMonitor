//
//  MenuView.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/22.
//

#import "MenuView.h"
//#import "SCCollectionCell.h"

#define identifier @"MenuCell"
@implementation MenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor colorWithWhite:0.4 alpha:0.5].CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 4;
        self.layer.masksToBounds = NO;
    }
    return self;
}


@end
