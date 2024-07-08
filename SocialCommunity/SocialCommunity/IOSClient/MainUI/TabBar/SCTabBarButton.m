//
//  SCTabBarButton.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCTabBarButton.h"

@interface SCTabBarButton ()

@property (nonatomic, strong) UIImageView *normalImageView;
@property (nonatomic, strong) UIImageView *badgeImageView;
@property (nonatomic, strong) UILabel *normalLabel;
@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation SCTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.normalImageView];
        [self addSubview:self.badgeImageView];
        [self addSubview:self.normalLabel];
        [self addSubview:self.badgeLabel];
    }
    return self;
}

- (void)setTabbarItem:(SCTabBarItem *)tabbarItem {
    self.tabbarItem = tabbarItem;
    /* 常规状态 */
    self.normalImageView.image = tabbarItem.image;
    self.normalImageView.contentMode = UIViewContentModeCenter;
    
    /* 标题 */
    self.normalLabel.text = tabbarItem.title;
    self.normalLabel.font = tabbarItem.titleFont;
    self.normalLabel.textColor = tabbarItem.titleColor;
    self.normalLabel.textAlignment = NSTextAlignmentCenter;
    
    /* 标记 */
    self.badgeLabel.text = tabbarItem.badge;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.normalImageView.frame = CGRectMake(0, 0, 26, itemSize);
    self.normalLabel.frame = CGRectMake(0, CGRectGetMaxY(self.normalImageView.frame), itemSize, itemSize);
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.normalLabel.textColor = self.tabbarItem.selectedTitleColor;
        self.normalImageView.image = self.tabbarItem.selectedImage;
    }
    else {
        self.normalLabel.textColor = self.tabbarItem.titleColor;
        self.normalImageView.image = self.tabbarItem.image;
    }
}

@end
