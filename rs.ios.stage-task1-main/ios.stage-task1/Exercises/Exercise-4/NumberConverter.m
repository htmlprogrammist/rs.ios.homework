#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    NSInteger x = ABS([number intValue]);
    NSInteger i = 0;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    while (x > 0) {
        result[i] = [NSString stringWithFormat: @"%ld", x % 10];
        i++;
        x = x / 10;
    }
    
    return result;
}

@end
