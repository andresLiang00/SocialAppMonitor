//
//  SCTopLargeTitle.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCTopLargeTitle.h"

@interface SCTopLargeTitle ()

// 用户名称对应的button
@property (nonatomic, strong) UIButton *nameIconBut;
// 需进行赋值的title内容
@property (nonatomic, strong) UILabel *textContent;

@end

@implementation SCTopLargeTitle

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
//        _nameIconBut = [[UIButton alloc] initWithFrame:CGRectZero];
//        _textContent = [[UILabel alloc] initWithFrame:CGRectZero];
//        [self addSubview:self.nameIconBut];
//        [self addSubview:self.textContent];
    }
    return self;
}

- (void)setNameIconString:(NSString *)nameIconString {
    if (!_nameIconString) {
        _nameIconString = nameIconString;
        self.nameIconBut = [[UIButton alloc] initWithFrame:CGRectZero];
        [self addSubview:self.nameIconBut];
    }
}

- (void)setTextContentString:(NSString *)textContentString {
    if (!_textContentString) {
        _textContentString = textContentString;
        self.textContent = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:self.textContent];
    }
}


- (void)setNameIconBut:(UIButton *)nameIconBut {
    if (!_nameIconBut) {
//        _nameIconBut = nameIconBut;
        _nameIconBut = [[UIButton alloc] init];
        _nameIconBut.frame = CGRectMake(16.0, 10.0, 36.0, 36.0);
        _nameIconBut.layer.cornerRadius = 18.f;
        // 设置名字icon
//        [_nameIconBut setTitle:nameIconBut.titleLabel.text forState:UIControlStateNormal];
        [_nameIconBut setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:_nameIconString attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Inconsolata_Regular size:15]}] forState:UIControlStateNormal];
        _nameIconBut.backgroundColor = [UIColor colorWithHexString:@"#4873F2"];
        [_nameIconBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nameIconBut addTarget:self action:@selector(nameClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nameIconBut];
    }
}

- (void)setTextContent:(UILabel *)textContent {
    if (!_textContent) {
        _textContent = [[UILabel alloc] init];
        _textContent.text = _textContentString;
        _textContent.frame = CGRectMake(CGRectGetMaxX(_nameIconBut.frame) + 8, 12.0, 200, 32.0);
        _textContent.textColor = [UIColor blackColor];
        _textContent.font = [UIFont fontWithName:AppFont.shared.font_Latin_Bold size:25];
        [_textContent sizeToFit];
        [self addSubview:_textContent];
    }
}

# pragma mark - 名字按钮点击

- (void)nameClick:(UIButton *)sender {
    NSLog(@"点击头像");
}

@end
