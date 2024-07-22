//
//  SCAdd.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCAdd.h"
#import "MenuView.h"

@interface SCAdd ()

@property (nonatomic, strong) MenuView *functionMenu;

@end

@implementation SCAdd

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

- (void)setAddFunctionBut:(UIButton *)addFunctionBut {
    if (!_addFunctionBut) {
        _addFunctionBut = [[UIButton alloc] init];
        _addFunctionBut.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_addFunctionBut setImage:[UIImage imageNamed:@"icon_add"] forState:UIControlStateNormal];
//        _addFunctionBut.layer.cornerRadius = self.frame.size.width / 2.0;
//        _addFunctionBut.layer.borderWidth = 2.f;
//        _addFunctionBut.layer.borderColor = [UIColor grayColor].CGColor;
        [_addFunctionBut addTarget:self action:@selector(addIconClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addFunctionBut];
    }

}

# pragma mark - 添加按钮点击
- (void)addIconClick:(UIButton *)sender {
    NSLog(@"Add isClick");
    
}

@end
