//
//  SCTabBarItem.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCTabBarItem.h"

@implementation SCTabBarItem


- (id)initWithTitle:(NSString *)title
          titleFont:(UIFont *)titleFont
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage
         titleColor:(UIColor *)titleColor
 selectedTitleColor:(UIColor *)selectedTitleColor
         badgeColor:(UIColor *)badgeColor {
    self = [super init];
    if (self) {
        self.title = title;
        self.titleFont = titleFont;
        self.image = image;
        self.selectedImage = selectedImage;
        self.titleColor = titleColor;
        self.selectedTitleColor = selectedTitleColor;
        self.badge = [[NSString alloc] init];
        self.dotShown = NO;
        self.badgeColor = badgeColor;
    }
    return self;
}

/**
 赋值
 
 @param item item
 */
- (void)copyClone:(SCTabBarItem *)item {
    self.title = item.title;
    self.image = item.image;
    self.selectedImage = item.selectedImage;
    self.titleColor = item.titleColor;
    self.selectedTitleColor = item.selectedTitleColor;
    self.badgeColor = item.badgeColor;
}


@end
