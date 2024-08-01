//
//  SCSearch.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCSearch.h"

@implementation SCSearch

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
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setSearchContentBut:(UIButton *)searchContentBut {
    if (!_searchContentBut) {
        _searchContentBut = [[UIButton alloc] init];
        NSLog(@"%f",self.frame.size.width);
        _searchContentBut.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_searchContentBut setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
        [_searchContentBut addTarget:self action:@selector(searchIconClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_searchContentBut];
    }
}


# pragma mark - 搜索按钮点击

- (void)searchIconClick:(UIButton *)sender {
    NSLog(@"点击搜索 后续需要设置跳转界面");
}

@end
