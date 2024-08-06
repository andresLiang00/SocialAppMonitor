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
        [self createContent];
    }
    return self;
}

- (void)createContent {
//    NSLog(@"cell width:%f", self.frame.size.width);
//    NSLog(@"cell height:%f", self.frame.size.height);
    self.backgroundColor = [UIColor whiteColor];
    
    /* 图标 */
    self.iconTV = [[UIImageView alloc] init];
    self.iconTV.frame = CGRectMake(10, 15, 20, 20);
    self.iconTV.tintColor = [UIColor blackColor];
    self.iconTV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.iconTV];
    
    /* 文字内容 */
    self.menuLabel = [[UILabel alloc] init];
    self.menuLabel.frame = CGRectMake(CGRectGetMaxX(self.iconTV.frame) + 10, 10, self.frame.size.width - (CGRectGetMaxX(self.iconTV.frame) + 10), 30);
    self.menuLabel.textColor = [UIColor blackColor];
    self.menuLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.menuLabel];
    
    
}

@end
