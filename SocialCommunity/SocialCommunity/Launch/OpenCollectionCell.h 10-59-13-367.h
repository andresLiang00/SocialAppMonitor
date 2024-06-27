//
//  OpenCollectionCell.h
//  SocialCommunity
//
//  Created by Andres on 2024/6/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *CollectionTitle;
@property (weak, nonatomic) IBOutlet UIImageView *CollectionBanner;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
