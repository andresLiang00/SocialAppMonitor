//
//  SCTopSettingTabBar.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import <UIKit/UIKit.h>
#import "SCAdd.h"

NS_ASSUME_NONNULL_BEGIN


@interface SCTopSettingTabBar : UIView

// 顶部右侧添加按钮
@property (nonatomic, strong) SCAdd *SCAdd;
- (void)selectedViewWithTag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
