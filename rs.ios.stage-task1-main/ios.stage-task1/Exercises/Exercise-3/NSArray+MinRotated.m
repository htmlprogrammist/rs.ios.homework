#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    NSArray *element = [self sortedArrayUsingSelector: @selector(compare:)];
    NSNumber *number = [element firstObject];
    return number;
}

@end
