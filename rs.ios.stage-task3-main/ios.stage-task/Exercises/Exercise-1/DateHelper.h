#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateHelper : NSObject

- (NSString *)monthNameBy:(NSUInteger)monthNumber;
- (long)dayFromDate:(NSString *)date;
- (NSString *)getDayName:(NSDate *)date;
- (BOOL)isDateInThisWeek:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
