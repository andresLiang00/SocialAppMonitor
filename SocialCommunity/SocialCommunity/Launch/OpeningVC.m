//
//  ViewController.m
//  SocialCommunity
//
//  Created by Andres on 2024/6/26.
//

#import "OpeningVC.h"
#import "LaunchCollectionCell.h"

@interface OpeningVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *bannerView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

// banner图集
@property (nonatomic, strong) NSArray *openImageSets;
// 各banner对应文字
@property (nonatomic, strong) NSArray *openbannerTitles;
// banner轮播时间
@property (nonatomic, strong) NSTimer *bannerTimer;
// 登入按钮接口
@property (weak, nonatomic) IBOutlet UIButton *buttonLoginIn;
// 访问作者的主页
@property (weak, nonatomic) IBOutlet UILabel *labelAuthor;
@property (weak, nonatomic) IBOutlet UIButton *buttonMyHost;

@end

@implementation OpeningVC

NSString *identifier = @"OpenCell";
/* MARK: Back to first page */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SocialCommunity";
    self.view.backgroundColor = AppColor.shared.launchColor;
    _labelAuthor.text = NSLocalizedString(@"_author_name_title_", @"");
    _labelAuthor.textColor = AppColor.shared.textWhiteColor;
    _labelAuthor.font = [UIFont fontWithName:AppFont.shared.font_Inconsolata_Light size:18];
    /* banner */
    [_bannerView registerNib:[UINib nibWithNibName:@"LaunchCollectionCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    _bannerView.dataSource = self;
    _bannerView.delegate = self;
    _bannerView.backgroundColor = AppColor.shared.launchColor;
    /* dataSources & text */
    self.openImageSets = @[[UIImage imageNamed:@"banner1"],[UIImage imageNamed:@"banner2"],[UIImage imageNamed:@"banner3"]];
    self.openbannerTitles = @[NSLocalizedString(@"_banner_1_title_", @""), NSLocalizedString(@"_banner_2_title_", @""), NSLocalizedString(@"_banner_3_title_", @"")];
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bannerScroll) userInfo:nil repeats:true];
    
    /* Login button */
    _buttonLoginIn.layer.cornerRadius = 20.0f;
    [_buttonLoginIn setBackgroundColor:AppColor.shared.borderWhiteColor];
    NSAttributedString *login_attribute = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_button_login_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.launchColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Inconsolata_Regular size:18]}];
    [_buttonLoginIn setAttributedTitle:login_attribute forState:UIControlStateNormal];
    
    
    NSMutableAttributedString *host_attribute =  [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_visit_github_website_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Inconsolata_Light size:15], NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [_buttonMyHost setAttributedTitle:host_attribute forState:UIControlStateNormal];
    
    
}

# pragma mark --- 访问主页的跳转
- (IBAction)visitMyHost:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:hostUrl]];
}

# pragma mark --- 轮播图timer的selector
- (void)bannerScroll {
    if (_pageControl.currentPage + 1 >= _openbannerTitles.count ) {
        /* MARK: Back to first page */
        _pageControl.currentPage = 0;
    }
    else {
        _pageControl.currentPage ++;
    }
    
    [_bannerView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_pageControl.currentPage inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:true];
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    LaunchCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = AppColor.shared.launchColor;
    cell.indexPath = indexPath;
    cell.image = [_openImageSets objectAtIndex:indexPath.row];
    cell.title = [_openbannerTitles objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { 
    return _openbannerTitles.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _bannerView.bounds.size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (!self.bannerTimer) {
        self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bannerScroll) userInfo:nil repeats:true];
    }
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self destoryTimer];
}

# pragma mark --- 销毁timer
- (void)destoryTimer {
    [_bannerTimer invalidate];
    _bannerTimer = nil;
}

# pragma mark --- 点击空白事件

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

# pragma mark --- 登录跳转
- (IBAction)onOpenLogin:(id)sender {
    
}

@end
