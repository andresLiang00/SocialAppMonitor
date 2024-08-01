//
//  SCTopSettingTabBar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCTopSettingTabBar.h"

#import "SCTopLargeTitle.h"
#import "SCSearch.h"
//#import "SCAdd.h"
#import "SCSetting.h"

#import "SCCalendar.h"

#define edgePadding 10.0
#define eachPadding 20.0
#define eachWidth 30.0

@interface SCTopSettingTabBar ()

// 顶部偏左侧标题
@property (nonatomic, strong) SCTopLargeTitle *SCTopTitle;
// 顶部右侧搜索按钮
@property (nonatomic, strong) SCSearch *SCSearch;
// 顶部右侧添加按钮
//@property (nonatomic, strong) SCAdd *SCAdd;
// 顶部右侧设置按钮
@property (nonatomic, strong) SCSetting *SCSetting;

@end

@implementation SCTopSettingTabBar

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

- (SCTopLargeTitle *)SCTopTitle {
    if (!_SCTopTitle) {
        _SCTopTitle = [[SCTopLargeTitle alloc] initWithFrame:CGRectZero];
    }
    return _SCTopTitle;
}

//- (SCSearch *)SCSearch {
//    if (!_)
//}

- (void)selectedViewWithTag:(NSInteger)tag {
    _SCTopTitle = [[SCTopLargeTitle alloc] initWithFrame:CGRectZero];
    _SCSearch = [[SCSearch alloc] initWithFrame:CGRectZero];
    _SCAdd = [[SCAdd alloc] init];
    _SCSetting = [[SCSetting alloc] initWithFrame:CGRectZero];
    /* 清除旧视图 */
    for (UIView *oldSubView in self.subviews) {
        [oldSubView removeFromSuperview];
    }
    
    switch (tag) {
        case 0: {
            //  消息页
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);          
            _SCTopTitle.nameIconString = @"测试";
            _SCTopTitle.textContentString = @"我的消息";
            [self addSubview:_SCTopTitle];
            
            _SCSearch.frame = CGRectMake(fullWidth - eachWidth * 2 - eachPadding - edgePadding, 12, eachWidth, eachWidth);
            _SCSearch.searchContentBut = [[UIButton alloc] initWithFrame:CGRectZero];
            NSLog(@"%@", _SCSearch.userInteractionEnabled == YES? @"yes":@"no");
            [self addSubview:_SCSearch];
            
            _SCAdd.view.frame = CGRectMake(fullWidth - eachWidth - edgePadding, 12, eachWidth, eachWidth);
            _SCAdd.addFunctionBut = [[UIButton alloc] initWithFrame:CGRectZero];
            [self addSubview:_SCAdd.view];
            
        }
            break;
        
        case 1: {
            //  文件页
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            _SCTopTitle.nameIconString = @"测试";
            _SCTopTitle.textContentString = @"我的文件";
            [self addSubview:_SCTopTitle];
        }
            break;
        case 2: {
            //  工作台
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            _SCTopTitle.nameIconString = @"测试";
            _SCTopTitle.textContentString = @"工作台";
            [self addSubview:_SCTopTitle];
        }
            break;
        case 3: {
            //  会议
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            _SCTopTitle.nameIconString = @"测试";
            _SCTopTitle.textContentString = @"视频会议";
            [self addSubview:_SCTopTitle];
        }
            break;
        case 4: {
            //  日历
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            _SCTopTitle.nameIconString = @"测试";
            _SCTopTitle.textContentString = [SCCalendar shared].dateString;
            [self addSubview:_SCTopTitle];
        }
            break;
            
        default:
            break;
    }
}


@end
