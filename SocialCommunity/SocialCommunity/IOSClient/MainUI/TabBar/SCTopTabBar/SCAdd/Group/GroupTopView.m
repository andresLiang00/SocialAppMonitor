//
//  GroupTopView.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import "GroupTopView.h"

@implementation GroupTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGroupTopView];
    }
    return self;
}

- (void)setupGroupTopView {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.groupClose];
    [self addSubview:self.groupTitle];
    [self addSubview:self.groupCreate];
    [self addSubview:self.searchSpace];
    /* 搜索栏 */
    [self.searchSpace addSubview:self.searchIcon];
    [self.searchSpace addSubview:self.searchTF];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.groupClose.frame = CGRectMake(20, 20, 20, 20);
    /* 扩大点击范围 */
    [self.groupClose setEnlargeEdgeWithTop:20 right:20 bottom:10 left:20];
    
    self.groupTitle.frame = CGRectMake(0, 20, 150, 20);
    self.groupTitle.center = CGPointMake(0.5 * self.frame.size.width, _groupTitle.center.y);
    
    self.groupCreate.frame = CGRectMake(self.frame.size.width - 60, 20, 40, 20);
    
    /* 搜索区域 */
    self.searchSpace.frame = CGRectMake(15, CGRectGetMaxY(self.groupTitle.frame) + 10, fullWidth - 30, 30);
    self.searchIcon.frame = CGRectMake(10, 5, 20, 20);
    self.searchTF.frame = CGRectMake(CGRectGetMaxX(self.searchIcon.frame) + 10, 5, self.searchSpace.frame.size.width - (CGRectGetMaxX(self.searchIcon.frame) + 10), 20);
    
}

/* 关闭按钮 */
- (UIButton *)groupClose {
    if (!_groupClose) {
        _groupClose = [[UIButton alloc] init];
        [_groupClose setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
        [_groupClose setBackgroundColor:[UIColor whiteColor]];
    }
    
    return _groupClose;
}

/* 标题 */
- (UILabel *)groupTitle {
    if (!_groupTitle) {
        _groupTitle = [[UILabel alloc] init];
        _groupTitle.text = NSLocalizedString(@"_addMenu_createGroup_", @"");
        _groupTitle.textAlignment = NSTextAlignmentCenter;
        _groupTitle.textColor = [UIColor blackColor];
        _groupTitle.font = [UIFont boldSystemFontOfSize:15.0];
    }
    
    return _groupTitle;
}

/* 假如选中的群组数量大于0 */
- (UILabel *)includeGroupLabel {
    if (!_includeGroupLabel) {
        _includeGroupLabel = [[UILabel alloc] init];
    }
    
    return _includeGroupLabel;
}

/* 创建群组 */
- (UIButton *)groupCreate {
    if (!_groupCreate) {
        _groupCreate = [[UIButton alloc] init];
        [_groupCreate setTitle:@"创建" forState:UIControlStateNormal];
        [_groupCreate setTitleColor:AppColor.shared.iconBlue forState:UIControlStateNormal];
        [_groupCreate.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    
    return _groupCreate;
}

/* 搜索栏 */
- (UIView *)searchSpace {
    if (!_searchSpace) {
        _searchSpace = [[UIView alloc] init];
        _searchSpace.backgroundColor = AppColor.shared.lightGrayViewColor;
        _searchSpace.layer.cornerRadius = 5.0;
    }
    
    return _searchSpace;
}

- (UIImageView *)searchIcon {
    if (!_searchIcon) {
        _searchIcon = [[UIImageView alloc] init];
        _searchIcon.image = [[UIImage imageNamed:@"icon_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _searchIcon.tintColor = [UIColor grayColor];
        
    }
    
    return _searchIcon;
}

/* 搜索框 */
- (UITextField *)searchTF {
    if (!_searchTF) {
        _searchTF = [[UITextField alloc] init];
//        _searchTF.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"搜索联系人、部门和我管理的群组" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Inconsolata_Regular size:12]}];
        _searchTF.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"搜索联系人、部门和我管理的群组" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        _searchTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    
    return _searchTF;
}

# pragma mark - 更新选中的群组文字
- (void)updateIncludeGroups:(CGFloat)groupNum {
    if (groupNum == 0) {
        [self.includeGroupLabel removeFromSuperview];
        _groupTitle.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    else if (groupNum > 0) {
        _includeGroupLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%f个群组", groupNum] attributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        _groupTitle.transform = CGAffineTransformMakeTranslation(0, -5);
        _includeGroupLabel.frame = CGRectMake(0, 17, 100, 20);
        _includeGroupLabel.center = CGPointMake(0.5 * self.frame.size.width, _groupTitle.center.y);
        [self addSubview:_includeGroupLabel];
    }
}
@end
