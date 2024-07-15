//
//  UIButton+ExtendEdge.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ExtendEdge)

/** 设置可点击范围到按钮边缘的距离 */
- (void)setEnlargeEdge:(CGFloat)size;
 
/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end

NS_ASSUME_NONNULL_END
