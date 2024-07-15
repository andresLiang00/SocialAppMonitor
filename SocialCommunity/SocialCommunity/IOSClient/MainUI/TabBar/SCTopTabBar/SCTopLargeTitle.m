//
//  SCTopLargeTitle.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCTopLargeTitle.h"

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
//        [self addSubview:_nameIconBut];
//        [self addSubview:_textContent];
    }
    return self;
}

- (void)setNameIconBut:(UIButton *)nameIconBut {
    if (!_nameIconBut) {
//        _nameIconBut = nameIconBut;
        _nameIconBut = [[UIButton alloc] init];
        _nameIconBut.frame = CGRectMake(16.0, 10.0, 36.0, 36.0);
        _nameIconBut.layer.cornerRadius = 18.f;
        // 设置名字icon
//        [_nameIconBut setTitle:nameIconBut.titleLabel.text forState:UIControlStateNormal];
        [_nameIconBut setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:nameIconBut.titleLabel.text attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Inconsolata_Regular size:15]}] forState:UIControlStateNormal];
        _nameIconBut.backgroundColor = [UIColor colorWithHexString:@"#4873F2"];
        [_nameIconBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_nameIconBut];
    }
}

- (void)setTextContent:(UILabel *)textContent {
    if (!_textContent) {
        _textContent = [[UILabel alloc] init];
        _textContent.text = textContent.text;
        _textContent.frame = CGRectMake(CGRectGetMaxX(_nameIconBut.frame) + 8, 12.0, 200, 32.0);
        _textContent.textColor = [UIColor blackColor];
        _textContent.font = [UIFont fontWithName:AppFont.shared.font_Latin_Bold size:25];
        [_textContent sizeToFit];
        [self addSubview:_textContent];
    }
}

@end
