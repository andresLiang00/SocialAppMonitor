//
//  VCManagerTool.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCManagerTool : NSObject

/* 获取当前VC */
+ (UIViewController *)currentDisplayVC;

+ (void)show;
+ (void)dismiss;
+ (void)showInfoWithStatus:(nullable NSString*)status;
+ (void)showSuccessWithStatus:(nullable NSString*)status;
+ (void)showErrorWithStatus:(nullable NSString*)status;

@end

NS_ASSUME_NONNULL_END
