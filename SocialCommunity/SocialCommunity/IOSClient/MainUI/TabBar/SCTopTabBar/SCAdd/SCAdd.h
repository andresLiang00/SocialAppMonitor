//
//  SCAdd.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import <UIKit/UIKit.h>
#import "SCMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCAdd : UIViewController

// +号按钮
@property (nonatomic, strong) UIButton *addFunctionBut;

# pragma mark - 收起菜单
- (void)shouldDismissMenu;

@end

NS_ASSUME_NONNULL_END
