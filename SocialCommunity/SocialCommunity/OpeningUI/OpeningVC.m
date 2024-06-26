//
//  ViewController.m
//  SocialCommunity
//
//  Created by Andres on 2024/6/26.
//

#import "OpeningVC.h"

@interface OpeningVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *bannerView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

// banner图集
@property (nonatomic, strong) NSArray *openImageSets;
// 各banner对应文字
@property (nonatomic, strong) NSArray *openbannerTitles;
// banner轮播时间
@property (nonatomic, strong) NSTimer *bannerTimer;

@end

@implementation OpeningVC

NSString *identifier = @"OpenCell";
/* MARK: Back to first page */

- (void)loadView {
    self.openImageSets = @[[UIImage imageNamed:@"Banner1"],[UIImage imageNamed:@"Banner2"],[UIImage imageNamed:@"Banner3"]];
    self.openbannerTitles = @[NSLocalizedString(@"_banner_1_title_", @""), NSLocalizedString(@"_banner_2_title_", @""), NSLocalizedString(@"_banner_3_title_", @"")];
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bannerScroll) userInfo:nil repeats:true];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

//- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { 
//    <#code#>
//}
//
//- (void)encodeWithCoder:(nonnull NSCoder *)coder { 
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection { 
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize { 
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator { 
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate { 
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context { 
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded { 
//    <#code#>
//}

@end
