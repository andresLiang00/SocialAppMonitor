//
//  SCTopLargeTitle.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCTopLargeTitle : UIView

// 用户名称对应的button
@property (nonatomic, copy) NSString *nameIconString;
// 需进行赋值的title内容
@property (nonatomic, copy) NSString *textContentString;

@end



NS_ASSUME_NONNULL_END
