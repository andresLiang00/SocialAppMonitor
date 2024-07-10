//
//  SCTabBarButton.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCTabBarButton.h"

@interface SCTabBarButton ()

//@property (nonatomic, strong) UIImageView *badgeImageView;
@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation SCTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.iconImageView];
//        [self addSubview:self.badgeImageView];
        [self addSubview:self.titleLabel];
//        [self addSubview:self.badgeLabel];
    }
    return self;
}

- (void)setTabbarItem:(SCTabBarItem *)tabbarItem {
    _tabbarItem = tabbarItem;
    /* 常规状态 */
    self.iconImageView.image = tabbarItem.image;
    self.iconImageView.tintColor = AppColor.shared.itemIconColor;
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
//    NSLog(@"imageH:%f", self.tabbarItem.imageH);
//    NSLog(@"butW:%f", CGRectGetWidth(self.bounds));
    CGSize titleSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(CGRectGetWidth(self.frame), 13.f)];
//    CGFloat titleHeight = MIN(ceil(titleSize.height), 18.f);
    CGFloat titleHeight = ceil(titleSize.height);
    CGFloat iconWidth = self.tabbarItem.imageH;
    // maxWidth是取文字或图片最大值
    CGFloat maxWidth = MAX(titleSize.width, iconWidth);
    self.iconImageView.frame = CGRectMake(0, (CGRectGetHeight(self.bounds) - iconWidth) / 2, iconWidth, iconWidth);
    self.iconImageView.center = CGPointMake(0.5 * CGRectGetWidth(self.bounds), self.iconImageView.center.y);
    if (self.tag == 4) {
        self.badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iconWidth, iconWidth)];
        self.badgeLabel.text = [NSString stringWithFormat:@"%ld",(long)[SCCalendar shared].currentDay];
        self.badgeLabel.font = [UIFont fontWithName:AppFont.shared.font_Latin_Bold size:10];
        self.badgeLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeLabel.textColor = AppColor.shared.textWhiteColor;
        [self.badgeLabel sizeToFit];
        self.badgeLabel.center = self.iconImageView.center;
        [self addSubview:self.badgeLabel];
    }
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.iconImageView.frame) + 5, maxWidth, titleHeight);
    self.titleLabel.center = CGPointMake(0.5 * CGRectGetWidth(self.bounds), self.titleLabel.center.y);

}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        if (self.tag == 5) {
            self.titleLabel.textColor = self.tabbarItem.selectedTitleColor;
            self.iconImageView.image = self.tabbarItem.selectedImage;
            self.iconImageView.tintColor = AppColor.shared.itemTitleSelectedColor;
        }
        else {
            self.titleLabel.textColor = self.tabbarItem.selectedTitleColor;
            self.iconImageView.image = self.tabbarItem.selectedImage;
        }
    }
    else {
        self.titleLabel.textColor = self.tabbarItem.titleColor;
        self.iconImageView.image = self.tabbarItem.image;
        self.iconImageView.tintColor = AppColor.shared.itemIconColor;
    }
}


/* 重置按钮状态 */
- (void)resetButtonStatus {
    self.selected = false;
}

/* 点击事件动画-图标闪烁 */
- (void)shakeIconAnimaton {
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shake.fromValue = [NSNumber numberWithFloat:1.0];
    shake.toValue = [NSNumber numberWithFloat:0.8];
    shake.repeatCount = 1;
    [self.layer addAnimation:shake forKey:@"shakeAnimation"];
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
