//
//  SelectedTabbar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "SCSelectedTabbar.h"

@interface SCSelectedTabbar ()

@property (nonatomic, strong) UILabel *topInset;
@property (nonatomic, copy) NSArray *buttonTitles;
@property (nonatomic, strong) NSMutableArray *buttonImages;
@property (nonatomic, strong) NSMutableArray *buttonSelectedImages;
@property (nonatomic, strong) NSMutableArray *buttonViews;
@property (nonatomic, strong) NSMutableArray *dataArrays;

@end

@implementation SCSelectedTabbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBlurEffect];
        self.topInset = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0.5)];
        self.topInset.layer.borderColor = AppColor.shared.borderGrayColor.CGColor;
        self.topInset.layer.borderWidth = 0.5f;
        [self addSubview:self.topInset];
        self.buttonImages = [NSMutableArray array];
        self.buttonSelectedImages = [NSMutableArray array];
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

- (void)createBlurEffect {
    self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
//    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
//    toolbar.barStyle = UIBarStyleDefault;
//    [self addSubview:toolbar];
}

- (void)createBarItem {
//    self.buttonTitles = @[@"Message", @"File", @"Work", @"Meeting", @"Daily", @"More"];
    self.buttonTitles = @[NSLocalizedString(@"_message_item_", @""), NSLocalizedString(@"_file_item_", @""), NSLocalizedString(@"_work_item_", @""), NSLocalizedString(@"_meeting_item_", @""), NSLocalizedString(@"_daily_item_", @""), NSLocalizedString(@"_more_item_", @"")];
    NSArray *imgName = @[@"icon_msg", @"icon_file", @"icon_work", @"icon_meeting", @"icon_daily", @"icon_more"];
    NSArray *imgSelectedName = @[@"icon_msg_selected", @"icon_file_selected", @"icon_work_selected", @"icon_meeting_selected", @"icon_daily_selected", @"icon_more_selected"];
    
    for(int i = 0; i < imgName.count; i++) {
        UIImage *img = [[UIImage imageNamed:[imgName objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [_buttonImages addObject:img];
    }
    
    for(int i = 0; i < imgSelectedName.count; i++) {
        // 设置原始格式
        UIImage *img;
        if (i == 5) {
            img = [[UIImage imageNamed:[imgName objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else {
            img = [[UIImage imageNamed:[imgSelectedName objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        [_buttonSelectedImages addObject:img];
    }
    
    for (int i = 0; i < _buttonTitles.count; i++) {
        NSString *title = [self.buttonTitles objectAtIndex:i];
        UIImage *iconImg = [self.buttonImages objectAtIndex:i];
        UIImage *iconSelectedImg = [self.buttonSelectedImages objectAtIndex:i];
        SCTabBarItem *item = [[SCTabBarItem alloc] initWithTitle:title titleFont:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:10] image:iconImg selectedImage:iconSelectedImg imageHeight:self.imageHeight titleColor:AppColor.shared.itemTitleColor selectedTitleColor:AppColor.shared.itemTitleSelectedColor];
        [self.dataArrays addObject:item];
    }
    self.dataSources = [NSArray arrayWithArray:self.dataArrays];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.dataSources && self.dataSources.count > 0) {
        CGFloat itemWidth = fullWidth / self.dataSources.count;
        CGFloat itemHeight = CGRectGetHeight(self.bounds) - safetyBot;
        for (UIView *sub in self.subviews) {
            if ([sub isKindOfClass:[SCTabBarButton class]]) {
                SCTabBarButton *tabbut = (SCTabBarButton *)sub;
                tabbut.frame = CGRectMake(0, 0, itemWidth, itemHeight);
//                CGPoint imageCenter = CGPointMake((tabbut.tag + 0.5) * itemWidth, itemHeight/2 - safetyBot / 2);
                CGPoint imageCenter = CGPointMake((tabbut.tag + 0.5) * itemWidth, itemHeight/2);
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
    
    [self setDefaultButton];
//    [self.bgImageView bringSubviewToFront:self.lineImageView];
    
    [self setNeedsLayout];
}

/* 默认第0个被选中 */
- (void)setDefaultButton {
    for (SCTabBarButton *but in self.buttonViews) {
        if (but.tag == 0) {
            but.selected = true;
            self.selectedIndex = 0;
        }
    }
}

/* 按钮点击事件 */
- (void)tabbarButtonSelected:(SCTabBarButton *)tabbarButton {
    [self buttonClickReset];
    tabbarButton.selected = !tabbarButton.selected;
    if (self.selectedIndex != tabbarButton.tag) {
        /* 下标不一致时触发点击事件 */
        [tabbarButton shakeIconAnimaton];
    }
    self.selectedIndex = tabbarButton.tag;
}

- (void)buttonClickReset {
    for (SCTabBarButton *subBut in self.buttonViews) {
        [subBut resetButtonStatus];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (self.tabDelegate && [self.tabDelegate respondsToSelector:@selector(tabBar:tabDidSelectedIndex:)]) {
        [self.tabDelegate tabBar:self tabDidSelectedIndex:selectedIndex];
    }
}

@end
