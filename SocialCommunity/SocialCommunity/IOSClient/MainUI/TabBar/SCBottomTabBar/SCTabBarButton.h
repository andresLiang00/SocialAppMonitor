//
//  SCTabBarButton.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import <UIKit/UIKit.h>
#import "SCTabBarItem.h"

#define itemSize [UIScreen mainScreen].bounds.size.width / 6
NS_ASSUME_NONNULL_BEGIN

@interface SCTabBarButton : UIControl

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) SCTabBarItem *tabbarItem;
/* 重置按钮状态 */
- (void)resetButtonStatus;
/* 点击事件动画-图标闪烁 */
- (void)shakeIconAnimaton;

@end

NS_ASSUME_NONNULL_END
