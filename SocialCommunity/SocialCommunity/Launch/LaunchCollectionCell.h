//
//  LaunchCollectionCell.h
//  SocialCommunity
//
//  Created by Andres on 2024/6/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LaunchCollectionCell : UICollectionViewCell

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *title;

@end

NS_ASSUME_NONNULL_END
