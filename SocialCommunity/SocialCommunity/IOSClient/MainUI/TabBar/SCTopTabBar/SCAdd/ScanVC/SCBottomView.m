//
//  SCBottomView.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/6.
//

#import "SCBottomView.h"

@interface SCBottomView()

@property (nonatomic, strong) UISegmentedControl *controlTag;
@end

@implementation SCBottomView

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
        [self showStyle];
    }
    return self;
}

/* 展示底部标题 后续待拓展功能*/
- (void)showStyle {
    [self addSubview:self.controlTag];
    [UIView animateWithDuration:0.5 animations:^{
        self.controlTag.transform = CGAffineTransformMakeTranslation(40, 0);
    }];
}

- (UISegmentedControl *)controlTag {
    if (!_controlTag) {
        _controlTag = [[UISegmentedControl alloc] initWithItems:@[@"扫一扫", @"待开发"]];
        _controlTag.frame = CGRectMake(0, 0, 160, self.bounds.size.height);
        [_controlTag setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
        [_controlTag setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
//        _controlTag.momentary = YES;
        _controlTag.selectedSegmentIndex = 0;
        _controlTag.selectedSegmentTintColor = [UIColor blackColor];
        _controlTag.layer.borderColor = [UIColor blackColor].CGColor;
        _controlTag.layer.borderWidth = 5;
        for (int i = 0; i < 2; i++) {
            [[_controlTag.subviews objectAtIndex:i] setTintColor:[UIColor blackColor]];
        }
        [_controlTag addTarget:self action:@selector(segementChange:) forControlEvents:UIControlEventValueChanged];
        _controlTag.center = CGPointMake(0.5 * self.frame.size.width, _controlTag.center.y);
    }
    
    return _controlTag;
}

- (void)segementChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            [UIView animateWithDuration:0.5 animations:^{
                self.controlTag.transform = CGAffineTransformMakeTranslation(40, 0);
            }];
        }
            break;
        case 1: {
            [UIView animateWithDuration:0.5 animations:^{
                self.controlTag.transform = CGAffineTransformMakeTranslation(-40, 0);
            }];
        }
            break;
            
        default:
            break;
    }
}
@end
