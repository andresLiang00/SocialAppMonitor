//
//  SCCollectionLayout.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/24.
//

#import "SCCollectionLayout.h"

@implementation SCCollectionLayout {
    NSMutableArray *dataSourcesArray;
}

- (void)prepareLayout {
    dataSourcesArray = [[NSMutableArray alloc] init];
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
}



//- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    return dataSourcesArray;
//}



@end
