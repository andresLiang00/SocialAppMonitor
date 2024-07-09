//
//  SelectedTabbar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SelectedTabbar.h"

@interface SelectedTabbar ()

//@property (nonatomic, strong) UILabel *topInset;
@property (nonatomic, copy) NSArray *buttonTitles;
@property (nonatomic, strong) NSMutableArray *buttonImages;
@property (nonatomic, strong) NSMutableArray *buttonViews;
@property (nonatomic, strong) NSMutableArray *dataArrays;

@end

@implementation SelectedTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonImages = [NSMutableArray array];
        self.buttonViews = [NSMutableArray array];
        self.dataArrays = [NSMutableArray array];
    }
    return self;
}

- (void)setImageHeight:(CGFloat)imageHeight {
    _imageHeight = imageHeight;
    NSLog(@"%f",_imageHeight);
    [self createBarItem];
}

- (void)createBarItem {
    self.buttonTitles = @[@"Message", @"File", @"Work", @"Meeting", @"Daily", @"More"];
    NSArray *imgName = @[@"icon_msg", @"icon_file_selected", @"icon_work", @"icon_meeting", @"icon_daily", @"icon_more"];
    for(int i = 0; i < imgName.count; i++) {
        [_buttonImages addObject:[UIImage imageNamed:[imgName objectAtIndex:i]]];
    }
    for (int i = 0; i < _buttonTitles.count; i++) {
        NSString *title = [self.buttonTitles objectAtIndex:i];
        UIImage *iconImg = [self.buttonImages objectAtIndex:i];
        SCTabBarItem *item = [[SCTabBarItem alloc] initWithTitle:title titleFont:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:12] image:iconImg selectedImage:iconImg imageHeight:self.imageHeight titleColor:AppColor.shared.borderGrayColor selectedTitleColor:[UIColor blueColor]];
        [self.dataArrays addObject:item];
    }
    self.dataSources = [NSArray arrayWithArray:self.dataArrays];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.dataSources && self.dataSources.count > 0) {
        CGFloat itemWidth = fullWidth / self.dataSources.count;
        CGFloat itemHeight = CGRectGetHeight(self.bounds);
        for (UIView *sub in self.subviews) {
            if ([sub isKindOfClass:[SCTabBarButton class]]) {
                SCTabBarButton *tabbut = (SCTabBarButton *)sub;
                tabbut.frame = CGRectMake(0, 0, itemWidth, itemHeight);
                CGPoint imageCenter = CGPointMake((tabbut.tag + 0.5) * itemWidth, itemHeight/2 - safetyBot / 2);
                tabbut.center = imageCenter;
            }
        }
    }
    
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

/* 按钮点击事件 */
- (void)tabbarButtonSelected:(SCTabBarButton *)tabbarButton {
    if (self.selectedIndex != tabbarButton.tag) {
        /* 下标不一致时触发点击事件 */
        [self buttonClick:tabbarButton];
    }
    self.selectedIndex = tabbarButton.tag;
}

- (void)buttonClick:(SCTabBarButton *)tabbarButton {
    for (SCTabBarButton *subBut in self.buttonViews) {
        [subBut resetButtonStatus];
    }
    [tabbarButton shakeIconAnimaton];
}

@end
