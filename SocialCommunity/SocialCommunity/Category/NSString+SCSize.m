//
//  NSString+SCSize.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/8.
//

#import "NSString+SCSize.h"

@implementation NSString (SCSize)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



@end
