//
//  SCAdd.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/12.
//

#import "SCAdd.h"
#import "MenuView.h"
#import "SCCollectionLayout.h"
#import "SCMenunCell.h"

/* 二维码扫描界面 */
#import "SCScannerCodeVC.h"
/* 创建群组界面 */
#import "SCGroupCreate.h"

@interface SCAdd () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *MenuArrays;
@property (nonatomic, strong) NSMutableArray *ImageSetArrays;
@property (nonatomic, strong) MenuView *functionMenu;
@property (nonatomic, strong) SCCollectionLayout *menuLayout;

@property (nonatomic, strong) SCScannerCodeVC *scanVC;

@end

static NSString* menuIdentifier = @"MenuIdentifier";

@implementation SCAdd

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)setAddFunctionBut:(UIButton *)addFunctionBut {
    if (!_addFunctionBut) {
        _addFunctionBut = [[UIButton alloc] init];
        _addFunctionBut.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        UIImage *addImg = [[UIImage imageNamed:@"icon_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        NSLog(@"%f",addImg.size.height);
        [_addFunctionBut setImage:addImg forState:UIControlStateNormal];
        [_addFunctionBut setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        _addFunctionBut.imageView.tintColor = [UIColor blackColor];
//        _addFunctionBut.layer.cornerRadius = self.frame.size.width / 2.0;
//        _addFunctionBut.layer.borderWidth = 2.f;
//        _addFunctionBut.layer.borderColor = [UIColor grayColor].CGColor;
        [_addFunctionBut addTarget:self action:@selector(addIconClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_addFunctionBut];
    }

}

# pragma mark - 添加按钮点击
- (void)addIconClick {
    _addFunctionBut.selected = !_addFunctionBut.selected;
    NSLog(@"Add isClick");
    if (_addFunctionBut.selected) {
        self.functionMenu.hidden = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.functionMenu.frame = CGRectMake(fullWidth - 160 , CGRectGetMaxY(self.view.superview.frame), 150, 400);
        }];
    }
    else {
        self.functionMenu.hidden = YES;
        self.functionMenu.frame = CGRectMake(fullWidth, CGRectGetMaxY(self.view.superview.frame), 150, 400);
    }
}

# pragma mark - 收起菜单栏
- (void)shouldDismissMenu {
    if (_addFunctionBut.selected) {
        _addFunctionBut.selected = !_addFunctionBut.selected;
        self.functionMenu.hidden = YES;
        self.functionMenu.frame = CGRectMake(fullWidth, CGRectGetMaxY(self.view.superview.frame), 150, 400);
    }
}

# pragma mark - 菜单栏界面
- (MenuView *)functionMenu {
    if (!_functionMenu) {
        //创建一个layout布局类
        _functionMenu = [[MenuView alloc] initWithFrame:CGRectMake(fullWidth, CGRectGetMaxY(self.view.superview.frame), 150, 400) collectionViewLayout:self.menuLayout];
        NSLog(@"%f", _functionMenu.frame.size.width);
        NSLog(@"%f", _functionMenu.frame.size.height);
        _functionMenu.delegate = self;
        _functionMenu.dataSource = self;
        [_functionMenu registerClass:[SCMenunCell class] forCellWithReuseIdentifier:menuIdentifier];
//        [self.view.superview.superview addSubview:self.functionMenu];
        [[VCManagerTool currentDisplayVC].view addSubview:self.functionMenu];
    }
    return _functionMenu;
}

# pragma mark - 菜单栏布局
- (SCCollectionLayout *)menuLayout {
    if (!_menuLayout) {
        _menuLayout = [[SCCollectionLayout alloc] init];
        _menuLayout.dataArrays = self.MenuArrays;
        _menuLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return _menuLayout;
}

# pragma mark - 菜单栏文字内容
- (NSMutableArray *)MenuArrays {
    if (!_MenuArrays) {
        NSArray *menuName = 
        @[NSLocalizedString(@"_addMenu_scan_", @""),
          NSLocalizedString(@"_addMenu_createGroup_", @""),
          NSLocalizedString(@"_addMenu_addContacts_", @""),
          NSLocalizedString(@"_addMenu_newDocs_", @""),
          NSLocalizedString(@"_addMenu_newBase_", @""),
          NSLocalizedString(@"_addMenu_shareScreen_", @""),
          NSLocalizedString(@"_addMenu_newVideoMeeting_", @""),
          NSLocalizedString(@"_addMenu_joinVideoMeeting_", @"")
        ];
        _MenuArrays = [NSMutableArray arrayWithArray:menuName];
    }
    
    return _MenuArrays;
}

# pragma mark - 菜单栏图片内容
- (NSMutableArray *)ImageSetArrays {
    if (!_ImageSetArrays) {
        NSArray *imageSetName =
        @[@"icon_scan_line",
          @"icon_user_group",
          @"icon_user_add",
          @"icon_file_line",
          @"icon_table_line",
          @"icon_sharescreen_line",
          @"icon_meeting_line",
          @"icon_joinmeeting_line"
        ];
        
        _ImageSetArrays = [NSMutableArray arrayWithArray:imageSetName];
    }
    
    return _ImageSetArrays;
}

# pragma mark - 二维码扫描界面
- (SCScannerCodeVC *)scanVC {
    if (!_scanVC) {
        _scanVC = [[SCScannerCodeVC alloc] init];
        _scanVC.view.frame = CGRectMake(fullWidth, 0, fullWidth, fullHeight);
    }
    
    return _scanVC;
}

# pragma mark - 菜单点击事件
- (void)chooseMenu:(NSInteger)index {
    switch (index) {
        /* 扫一扫 */
        case 0: {
            /* 新增 防止连续的快速点击 */
            [VCManagerTool currentDisplayVC].view.userInteractionEnabled = NO;
            if (_scanVC) {
                _scanVC = nil;
            }
            [[VCManagerTool currentDisplayVC].view addSubview:self.scanVC.view];
            [UIView animateWithDuration:0.25 animations:^{
                self.scanVC.view.frame = [UIScreen mainScreen].bounds;
            } completion:^(BOOL finished) {
                [VCManagerTool currentDisplayVC].view.userInteractionEnabled = YES;
            }];
//            [[VCManagerTool currentDisplayVC] presentViewController:self.scanVC animated:YES completion:nil];
        }
            break;
        
        /* 创建群组 */
        case 1: {
//            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
            SCGroupCreate *groupCreateVC = [[SCGroupCreate alloc] init];
            [[VCManagerTool currentDisplayVC] presentViewController:groupCreateVC animated:YES completion:nil];
        }
            break;
            
        /* 添加联系人 */
        case 2: {
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
        
        /* 创建文档 */
        case 3: {
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
            
        /* 创建多维表格 */
        case 4: {
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
        
        /* 会议室投屏 */
        case 5: {
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
        
        /* 发起视频会议 */
        case 6: {      
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
        
        /* 加入视频会议 */
        case 7: {
            [VCManagerTool showInfoWithStatus:[NSString stringWithFormat:@"%@开发中",[_MenuArrays objectAtIndex:index]]];
        }
            break;
            
        default:
            break;
    }
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SCMenunCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:menuIdentifier forIndexPath:indexPath];
    NSString *cellImageName = [self.ImageSetArrays objectAtIndex:indexPath.section];
//    NSLog(@"%ld",indexPath.section);
//    NSLog(@"imgW:%f",cellImg.size.width);
//    NSLog(@"imgH:%f",cellImg.size.height);
    cell.iconIV.image = [[UIImage imageNamed:cellImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.menuLabel.text = [_MenuArrays objectAtIndex:indexPath.section];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { 
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _MenuArrays.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了菜单第%ld行", indexPath.section);
    [self chooseMenu:indexPath.section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_functionMenu.frame.size.width, _functionMenu.frame.size.height * 1.0 / _MenuArrays.count);
}




@end
