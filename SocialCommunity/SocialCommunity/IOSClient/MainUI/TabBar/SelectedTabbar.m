//
//  SelectedTabbar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SelectedTabbar.h"

@interface SelectedTabbar ()

@property (nonatomic, strong) NSMutableArray *buttonViews;

@end

@implementation SelectedTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setDataSources:(NSArray *)dataSources {
    _dataSources = dataSources;
    [self setupTabbarButtons];
    [self layoutSubviews];
}

/**
 重新创建tabbarButtons
 */
- (void)setupTabbarButtons {
    [self.buttonViews removeAllObjects];
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[SCTabBarButton class]]) {
            [subView removeFromSuperview];
        }
    }
    
    for (NSInteger index = 0; index < self.dataSources.count; index ++) {
        SCTabBarItem *tabbarItem = [self.dataSources objectAtIndex:index];
        SCTabBarButton *tabbarButton = [[SCTabBarButton alloc] initWithFrame:CGRectZero];
        tabbarButton.userInteractionEnabled = YES;
        tabbarButton.tabbarItem = tabbarItem;
        tabbarButton.tag = index;
//        tabbarButton.maxCircleSize = 40.0;
        [tabbarButton addTarget:self action:@selector(tabbarButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tabbarButton];
        [self.buttonViews addObject:tabbarButton];
    }
    
//    [self.bgImageView bringSubviewToFront:self.lineImageView];
    
    [self setNeedsLayout];
}

@end
