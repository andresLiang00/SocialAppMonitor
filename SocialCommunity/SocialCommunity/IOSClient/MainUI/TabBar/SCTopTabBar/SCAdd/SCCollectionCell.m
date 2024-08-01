//
//  SCCollectionCell.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/24.
//

#import "SCCollectionCell.h"

@implementation SCCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        [self createContent];
    }
    return self;
}

- (void)createContent {
//    NSLog(@"cell width:%f", self.frame.size.width);
//    NSLog(@"cell height:%f", self.frame.size.height);
    self.backgroundColor = [UIColor whiteColor];
    
    self.iconTV = [[UIImageView alloc] init];
    self.iconTV.frame = CGRectMake(10, 15, 20, 20);
    self.iconTV.tintColor = [UIColor blackColor];
    self.iconTV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.iconTV];
    
    self.menuLabel = [[UILabel alloc] init];
    self.menuLabel.frame = CGRectMake(CGRectGetMaxX(self.iconTV.frame) + 10, 10, self.frame.size.width - (CGRectGetMaxX(self.iconTV.frame) + 10), 30);
    self.menuLabel.textColor = [UIColor blackColor];
    self.menuLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.menuLabel];
    
    
}

@end
