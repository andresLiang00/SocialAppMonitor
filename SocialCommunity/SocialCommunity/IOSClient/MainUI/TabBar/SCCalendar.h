//
//  SCCalendar.h
//  SocialCommunity
//
//  Created by Tim on 2024/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCCalendar : NSObject

+ (SCCalendar *)shared;
@property (nonatomic, assign) NSInteger currentDay;
@property (nonatomic, copy) NSString *dateString;
@property (nonatomic, assign) NSInteger currentHour;
@property (nonatomic, assign) NSInteger currentMinute;
@end

NS_ASSUME_NONNULL_END
