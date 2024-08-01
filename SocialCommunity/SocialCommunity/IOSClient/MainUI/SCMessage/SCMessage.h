//
//  SCMessage.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SCMenuDelegate;
@interface SCMessage : UIViewController
//代理
@property (nonatomic, weak) id <SCMenuDelegate> menuDelegate;

@end

@protocol SCMenuDelegate <NSObject>

- (void)menuDismissListen:(SCMessage *)SCMsgVC;

@end
NS_ASSUME_NONNULL_END
