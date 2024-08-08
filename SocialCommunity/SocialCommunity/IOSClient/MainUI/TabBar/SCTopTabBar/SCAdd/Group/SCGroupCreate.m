//
//  SCGroupCreate.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import "SCGroupCreate.h"
#import "GroupTopView.h"
#import "GroupResultCell.h"

@interface SCGroupCreate () <UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) GroupTopView *groupTop;
/* 手机键盘高度 */
@property (nonatomic, assign) CGFloat keyboardHeight;
/* 搜索联系人界面 */
@property (nonatomic, strong) GroupSearch *searchView;
/* 搜索成功时的结果 */
@property (nonatomic, copy) NSArray *resultArray;
/* 被选中的群组的个数 */
@property (nonatomic, assign) CGFloat includeGroups;

@end

static NSString* groupIdentifier = @"GroupIdentifier";

@implementation SCGroupCreate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroupView];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupGroupView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.groupTop];
    [_groupTop.groupClose addTarget:self action:@selector(groupCloseRequest:) forControlEvents:UIControlEventTouchUpInside];
    [_groupTop.groupCreate addTarget:self action:@selector(groupCreateRequest:) forControlEvents:UIControlEventTouchUpInside];
    /* 获取键盘高度 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    self.groupTop.searchTF.delegate = self;
}

# pragma mark - 请求关闭按钮
- (void)groupCloseRequest:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - 请求创建群组
- (void)groupCreateRequest:(UIButton *)button {
    [VCManagerTool showWithStatus:@"创建群组中"];
    /* 测试 */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [VCManagerTool dismiss];
    });
}

# pragma mark - 查询群组成功
- (NSArray *)queryResultSuccess:(nonnull NSString *)query {
    /* 测试返回 */
    return @[@"测试1", @"测试2"];
}

- (GroupTopView *)groupTop {
    if (!_groupTop) {
        _groupTop = [[GroupTopView alloc] initWithFrame:CGRectMake(0, 0, fullWidth, 90)];
    }
    
    return _groupTop;
}

- (GroupSearch *)searchView {
    if (!_searchView) {
        _searchView = [[GroupSearch alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.groupTop.frame) + 10, fullWidth, fullHeight - (CGRectGetMaxY(self.groupTop.frame) + 10) - self.keyboardHeight)];
    }
    
    return _searchView;
}

- (NSArray *)resultArray {
    if(!_resultArray) {
        _resultArray = [NSArray array];
    }
    
    return _resultArray;
}

-(void)keyboardWillShow:(NSNotification *)notification {
    // 获取键盘高度
    CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"键盘高度为:%f", frame.size.height);
    self.keyboardHeight = frame.size.height;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view endEditing:YES];
//}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    if (textField.text.length == 0) {
        NSLog(@"搜索内容清空");
        self.searchView.querySuccess = NO;
        [self.searchView removeFromSuperview];
    }
    else{
        NSLog(@"包含搜索内容");
        self.searchView.queryContent = textField.text;
        NSLog(@"搜索内容:%@", textField.text);
        [self.view addSubview:self.searchView];
        if ([textField.text containsString:@"测试"]) {
            NSLog(@"创建:%@", textField.text);
            self.resultArray = [self queryResultSuccess:textField.text];
            self.searchView.querySuccess = YES;
            self.searchView.queryResultView.delegate = self;
            self.searchView.queryResultView.dataSource = self;
            [self.searchView.queryResultView registerClass:[GroupResultCell class] forCellWithReuseIdentifier:groupIdentifier];
        }
        else {
            self.searchView.querySuccess = NO;
        }
    }

}

//点击键盘的回车键
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"]) {
        [self.view endEditing:YES];
        return NO;
    }
    
    return YES;
}


- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GroupResultCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:groupIdentifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
    if (indexPath.section > self.resultArray.count) {
        /* 防止越界 */
        return nil;
    }
    
    NSString *groupName = [self.resultArray objectAtIndex:indexPath.section];
    cell.groupName.text = groupName;
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _resultArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第%ld行", indexPath.section);
//    [self chooseMenu:indexPath.section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(fullWidth, 60);
}

@end
