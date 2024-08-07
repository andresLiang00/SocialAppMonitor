//
//  UIImage+AjustImage.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import "UIImage+AjustImage.h"

@implementation UIImage (AjustImage)

+ (UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);// 关键代码

    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];

    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();

    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
