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

# pragma mark - 获取当前日期

- (void)getDate {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:currentDate];
    NSInteger year = [component year];
    NSInteger month = [component month];
    NSInteger day = [component day];
    NSInteger hour = [component hour];
    NSInteger minute = [component minute];
    self.currentDay = day;
    self.currentHour = hour;
    self.currentMinute = minute;
    self.dateString = [NSString stringWithFormat:@"%ld年%ld月", year, month];
   
}



@end
