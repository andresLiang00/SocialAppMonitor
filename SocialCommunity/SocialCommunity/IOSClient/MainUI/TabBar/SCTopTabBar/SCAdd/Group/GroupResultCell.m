//
//  GroupResultCell.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import "GroupResultCell.h"

@implementation GroupResultCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createContent];
    }
    return self;
}

- (void)createContent {
    self.backgroundColor = [UIColor whiteColor];
    
    /* 是否被选中 */
    self.isSelectedBut = [[UIButton alloc] init];
    self.isSelectedBut.frame = CGRectMake(10, 20, 20, 20);
    self.isSelectedBut.layer.cornerRadius = 10;
    self.isSelectedBut.layer.borderColor = AppColor.shared.borderGrayColor.CGColor;
    self.isSelectedBut.layer.borderWidth = 1.0f;
    [self.isSelectedBut setImage:[[UIImage imageNamed:@"icon_tag_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    self.isSelectedBut.imageView.tintColor = [UIColor whiteColor];
    [self.isSelectedBut setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [self.isSelectedBut addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.isSelectedBut];
    
    /* 图标 */
    self.iconIV = [[UIImageView alloc] init];
    self.iconIV.frame = CGRectMake(CGRectGetMaxX(self.isSelectedBut.frame) + 10, 10, 40, 40);
    self.iconIV.image = [UIImage imageNamed:@"icon_default_group"];
//    self.iconIV.tintColor = [UIColor blackColor];
    self.iconIV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.iconIV];
    
    /* 文字内容 */
    self.groupName = [[UILabel alloc] init];
    self.groupName.frame = CGRectMake(CGRectGetMaxX(self.iconIV.frame) + 10, 15, self.frame.size.width - (CGRectGetMaxX(self.iconIV.frame) + 10) - 40, 30);
    self.groupName.textColor = [UIColor blackColor];
    self.groupName.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.groupName];
    
    /* 感叹号标识 */
    self.infoButton = [[UIButton alloc] init];
    self.infoButton.frame = CGRectMake(self.frame.size.width - 30, 20, 20, 20);
    [self.infoButton setImage:[[UIImage imageNamed:@"icon_info"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.infoButton.imageView.tintColor = [UIColor grayColor];
    [self addSubview:self.infoButton];
    
}

# pragma mark - 删除按钮被点击
- (void)deleteClick:(UIButton *)but {
    but.selected = !but.selected;
    if (but.isSelected) {
        [but setBackgroundColor:AppColor.shared.iconBlue];
    }
    else {
        [but setBackgroundColor:[UIColor whiteColor]];
    }
    if (self.deleteBlock) {
        self.deleteBlock(but.selected?TRUE:FALSE);
    }
}

@end
