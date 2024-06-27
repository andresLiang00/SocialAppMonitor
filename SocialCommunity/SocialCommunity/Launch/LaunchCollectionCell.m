//
//  LaunchCollectionCell.m
//  SocialCommunity
//
//  Created by Andres on 2024/6/27.
//

#import "LaunchCollectionCell.h"

@interface LaunchCollectionCell()

@property (weak, nonatomic) IBOutlet UILabel *CollectionTitle;
@property (weak, nonatomic) IBOutlet UIImageView *CollectionBanner;

@end

@implementation LaunchCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.indexPath = [[NSIndexPath alloc] init];
    self.title = @"";
    self.image = [[UIImage alloc] init];
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
}

@synthesize image = _image;

- (UIImage *)image {
    return _image;
}
- (void)setImage:(UIImage *)image {
    _image = image;
    _CollectionBanner.image = image;
}

@synthesize title = _title;

- (NSString *)title {
    return _title;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    _CollectionTitle.text = title;
    _CollectionTitle.textColor = [UIColor whiteColor];
}

@end
