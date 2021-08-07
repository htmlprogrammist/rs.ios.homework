#import "NSDate+CustomDate.h"

@implementation NSDate (CustomDate)

+ (NSDate *)dateFrom:(NSString *)string {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd-MMM-yyyy";

    return [dateFormatter dateFromString:string];
}

+ (NSDate *)dateFrom:(NSInteger)day month:(NSInteger)month year:(NSInteger)year {
    NSDateComponents *components = [NSDateComponents new];
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];

    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
