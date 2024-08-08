//
//  GroupSearch.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupSearch : UIView

/* 搜索是否成功 */
@property (nonatomic, assign) BOOL querySuccess;
/* 搜索的内容 */
@property (nonatomic, copy) NSString *queryContent;

/* 搜索无结果时的界面 */
@property (nonatomic, strong) UIImageView *queryFailIcon;
@property (nonatomic, strong) UILabel *queryFailLabel;

/* 搜索有结果时的界面*/
@property (nonatomic, strong) UICollectionView *queryResultView;

@end

NS_ASSUME_NONNULL_END
