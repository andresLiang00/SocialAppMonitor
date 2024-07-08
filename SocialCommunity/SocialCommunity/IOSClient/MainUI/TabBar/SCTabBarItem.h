//
//  SCTabBarItem.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCTabBarItem : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;
@property (nonatomic, strong) UIColor *badgeColor;
@property (nonatomic, strong) NSString *badge;
@property (nonatomic, assign) BOOL dotShown;

- (void)copyClone:(SCTabBarItem *)item;

- (id)initWithTitle:(NSString *)title
          titleFont:(UIFont *)titleFont
              image:(UIImage *)image
      selectedImage:(UIImage *)selectedImage
         titleColor:(UIColor *)titleColor
 selectedTitleColor:(UIColor *)selectedTitleColor
         badgeColor:(UIColor *)badgeColor;

@end

NS_ASSUME_NONNULL_END
