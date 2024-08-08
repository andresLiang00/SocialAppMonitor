//
//  GroupSearch.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import "GroupSearch.h"
#import "SCCollectionLayout.h"

@implementation GroupSearch

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
        [self setupSearchField];
    }
    return self;
}

- (void)setupSearchField {
    self.backgroundColor = [UIColor whiteColor];
//    [self addSubview:self.queryResultView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.queryFailIcon.frame = CGRectMake(0, 0, 100, 100);
    self.queryFailIcon.center = CGPointMake(0.5 * self.frame.size.width, 0.5 * self.frame.size.height - 30);
    
    self.queryFailLabel.frame = CGRectMake(20, CGRectGetMaxY(self.queryFailIcon.frame) + 10, fullWidth - 40, 80);
//    self.queryFailLabel.center = CGPointMake(0.5 * self.frame.size.width, self.queryFailLabel.center.y);
    
}


- (UIImageView *)queryFailIcon {
    if (!_queryFailIcon) {
        _queryFailIcon = [[UIImageView alloc] init];
        _queryFailIcon.image = [UIImage imageNamed:@"icon_unreach"];
    }
    
    return _queryFailIcon;
}

- (UILabel *)queryFailLabel {
    if (!_queryFailLabel) {
        _queryFailLabel = [[UILabel alloc] init];
        _queryFailLabel.numberOfLines = 1;
        _queryFailLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _queryFailLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _queryFailLabel;
}

# pragma mark - 搜索成功时出现表格
- (UICollectionView *)queryResultView {
    if (!_queryResultView) {
        _queryResultView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, fullWidth, self.frame.size.height) collectionViewLayout:[[SCCollectionLayout alloc] init]];
        
    }
    
    return _queryResultView;
}

- (void)setQueryContent:(NSString *)queryContent {
    _queryContent = queryContent;
    NSMutableAttributedString *failContent = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"未搜索到“%@”相关结果", self.queryContent] attributes:@{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    [failContent addAttribute:NSForegroundColorAttributeName value:AppColor.shared.itemTitleSelectedColor range:NSMakeRange(5, failContent.length - 10)];
    _queryFailLabel.attributedText = failContent;
    [_queryResultView removeFromSuperview];
}

- (void)setQuerySuccess:(BOOL)querySuccess {
    _querySuccess = querySuccess;
    
    if (_querySuccess) {
        for (UIView *subview in self.subviews) {
            [subview removeFromSuperview];
        }
        
        [self addSubview:self.queryResultView];
    }
    
    else {
        [self addSubview:self.queryFailIcon];
        [self addSubview:self.queryFailLabel];
    }
}
@end
