//
//  SCTopSettingTabBar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCTopSettingTabBar.h"

#import "SCTopLargeTitle.h"
#import "SCSearch.h"
#import "SCAdd.h"
#import "SCSetting.h"

#import "SCCalendar.h"

@interface SCTopSettingTabBar ()

// 顶部偏左侧标题
@property (nonatomic, strong) SCTopLargeTitle *SCTopTitle;
// 顶部右侧搜索按钮
@property (nonatomic, strong) SCSearch *SCSearch;
// 顶部右侧添加按钮
@property (nonatomic, strong) SCAdd *SCAdd;
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
    _SCAdd = [[SCAdd alloc] initWithFrame:CGRectZero];
    _SCSetting = [[SCSetting alloc] initWithFrame:CGRectZero];
    /* 清除旧视图 */
    for (UIView *oldSubView in self.subviews) {
        [oldSubView removeFromSuperview];
    }
    
    switch (tag) {
        case 0: {
            //  消息页
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            UIButton *msgPageTitle = [[UIButton alloc] initWithFrame:CGRectZero];
            [msgPageTitle setTitle:@"其星" forState:UIControlStateNormal];
            UILabel *msgPageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            msgPageLabel.text = @"我的消息";
            
            _SCTopTitle.nameIconBut = msgPageTitle;
            _SCTopTitle.textContent = msgPageLabel;
            [self addSubview:_SCTopTitle];
        }
            break;
        
        case 1: {
            //  文件页
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            UIButton *msgPageTitle = [[UIButton alloc] initWithFrame:CGRectZero];
            [msgPageTitle setTitle:@"其星" forState:UIControlStateNormal];
            UILabel *msgPageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            msgPageLabel.text = @"我的文件";
            
            _SCTopTitle.nameIconBut = msgPageTitle;
            _SCTopTitle.textContent = msgPageLabel;
            [self addSubview:_SCTopTitle];
        }
            break;
        case 2: {
            //  工作台
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            UIButton *msgPageTitle = [[UIButton alloc] initWithFrame:CGRectZero];
            [msgPageTitle setTitle:@"其星" forState:UIControlStateNormal];
            UILabel *msgPageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            msgPageLabel.text = @"工作台";
            
            _SCTopTitle.nameIconBut = msgPageTitle;
            _SCTopTitle.textContent = msgPageLabel;
            [self addSubview:_SCTopTitle];
        }
            break;
        case 3: {
            //  会议
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            UIButton *msgPageTitle = [[UIButton alloc] initWithFrame:CGRectZero];
            [msgPageTitle setTitle:@"其星" forState:UIControlStateNormal];
            UILabel *msgPageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            msgPageLabel.text = @"视频会议";
            
            _SCTopTitle.nameIconBut = msgPageTitle;
            _SCTopTitle.textContent = msgPageLabel;
            [self addSubview:_SCTopTitle];
        }
            break;
        case 4: {
            //  日历
            _SCTopTitle.frame = CGRectMake(0, 0, fullWidth, 56.0f);
            UIButton *msgPageTitle = [[UIButton alloc] initWithFrame:CGRectZero];
            [msgPageTitle setTitle:@"其星" forState:UIControlStateNormal];
            UILabel *msgPageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            msgPageLabel.text = [SCCalendar shared].dateString;
            
            _SCTopTitle.nameIconBut = msgPageTitle;
            _SCTopTitle.textContent = msgPageLabel;
            [self addSubview:_SCTopTitle];
        }
            break;
            
        default:
            break;
    }
}


@end
