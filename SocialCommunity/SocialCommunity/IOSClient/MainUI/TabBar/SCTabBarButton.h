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

@property (nonatomic, strong) SCTabBarItem *tabbarItem;

@end

NS_ASSUME_NONNULL_END
