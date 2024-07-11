//
//  SelectedTabbar.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol SCTabbarDelegate;
@interface SCSelectedTabbar : UIView

//代理
@property (nonatomic, weak) id <SCTabbarDelegate> tabDelegate;
// imageview高度
@property (nonatomic, assign) CGFloat imageHeight;
// tabbarItem列表
@property (nonatomic, strong) NSArray *dataSources;
// 选中的tabbar按钮下标
@property (nonatomic, assign) NSInteger selectedIndex;

@end

@protocol SCTabbarDelegate <NSObject>

- (void)tabBar:(SCSelectedTabbar *)tabBar tabDidSelectedIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
