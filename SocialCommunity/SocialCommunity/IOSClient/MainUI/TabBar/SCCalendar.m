//
//  SCCalendar.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/10.
//

#import "SCCalendar.h"

@implementation SCCalendar

+ (instancetype)shared {
    static SCCalendar *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[SCCalendar alloc] init];
        [_instance getDate];
    });
    return _instance;
}

- (void)getDate {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitDay fromDate:currentDate];
    self.currentDay = [component day];
}



@end
