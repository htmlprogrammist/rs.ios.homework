#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CustomDate)

+ (NSDate *)dateFrom:(NSString *)string;
+ (NSDate *)dateFrom:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
