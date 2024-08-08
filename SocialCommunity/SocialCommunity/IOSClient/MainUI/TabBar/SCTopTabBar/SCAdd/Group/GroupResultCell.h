//
//  GroupResultCell.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^deleteBlock)(BOOL isSelected);

@interface GroupResultCell : UICollectionViewCell

@property (nonatomic, copy) deleteBlock deleteBlock;

@property (nonatomic, strong) UIButton *isSelectedBut;

@property (nonatomic, strong) UIImageView *iconIV;

@property (nonatomic, strong) UIButton *infoButton;

@property (nonatomic, strong) UILabel *groupName;

@end

NS_ASSUME_NONNULL_END
