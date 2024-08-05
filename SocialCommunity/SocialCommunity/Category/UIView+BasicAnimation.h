//
//  UIView+BasicAnimation.h
//  SocialCommunity
//
//  Created by Andres on 2024/6/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BasicAnimation)

- (void)createColor:(UIColor *)colorStart
           endColor:(UIColor *)colorEnd
         startPoint:(CGPoint)startPoint
           endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
