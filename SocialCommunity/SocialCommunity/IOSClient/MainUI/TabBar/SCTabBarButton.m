//
//  SCTabBarButton.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCTabBarButton.h"

@interface SCTabBarButton ()

//@property (nonatomic, strong) UIImageView *badgeImageView;
//@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, strong) UIView *combineView;

@end

@implementation SCTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.combineView];
        [self.combineView addSubview:self.iconImageView];
//        [self addSubview:self.badgeImageView];
        [self.combineView addSubview:self.titleLabel];
//        [self addSubview:self.badgeLabel];
    }
    return self;
}

- (void)setTabbarItem:(SCTabBarItem *)tabbarItem {
    _tabbarItem = tabbarItem;
    /* 常规状态 */
    self.iconImageView.image = tabbarItem.image;
    self.iconImageView.contentMode = UIViewContentModeCenter;
    
    /* 标题 */
    self.titleLabel.text = tabbarItem.title;
    self.titleLabel.font = tabbarItem.titleFont;
    self.titleLabel.textColor = tabbarItem.titleColor;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    /* 标记 */
//    self.badgeLabel.text = tabbarItem.badge;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"%f", self.frame.size.height);
    NSLog(@"imageH:%f", self.tabbarItem.imageH);
    NSLog(@"butW:%f", CGRectGetWidth(self.bounds));
    CGSize titleSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(CGRectGetWidth(self.frame), 13.f)];
//    CGFloat titleHeight = MIN(ceil(titleSize.height), 18.f);
    CGFloat titleHeight = ceil(titleSize.height);
    self.iconImageView.frame = CGRectMake(0, 0, self.tabbarItem.imageH / 2, self.tabbarItem.imageH / 2);
    self.iconImageView.center = CGPointMake(0.5 * CGRectGetWidth(self.bounds), self.iconImageView.center.y);
    self.titleLabel.frame = CGRectMake(CGRectGetMinX(self.iconImageView.frame), CGRectGetMaxY(self.iconImageView.frame) + 5, self.tabbarItem.imageH / 2, titleHeight);
    
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.titleLabel.textColor = self.tabbarItem.selectedTitleColor;
        self.iconImageView.image = self.tabbarItem.selectedImage;
    }
    else {
        self.titleLabel.textColor = self.tabbarItem.titleColor;
        self.iconImageView.image = self.tabbarItem.image;
    }
}

/* 重置按钮状态 */
- (void)resetButtonStatus {
    
}

/* 点击事件动画-图标闪烁 */
- (void)shakeIconAnimaton {
    
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.backgroundColor = [UIColor clearColor];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.clipsToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
