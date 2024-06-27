//
//  OpenCollectionCell.m
//  SocialCommunity
//
//  Created by Andres on 2024/6/26.
//

#import "OpenCollectionCell.h"

@implementation OpenCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.indexPath = [[NSIndexPath alloc] init];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
