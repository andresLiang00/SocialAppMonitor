//
//  UIImage+AjustImage.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (AjustImage)

+ (UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
