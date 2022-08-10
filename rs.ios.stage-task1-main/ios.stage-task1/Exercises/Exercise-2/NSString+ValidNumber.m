#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    NSUInteger length = [self length];
    
    if (length <= 0 || length > 100) {
            return NO;
    }
    
    BOOL result = YES;
    
    for (int i = 0; i < length; i++) {
        if (![[NSCharacterSet decimalDigitCharacterSet] characterIsMember: [self characterAtIndex: i]]) {
            result = NO;
            break;  // нашли символ, не входящий в decimalDigitCharacterSet => NO с break, чтобы последний символ-цифра не перезаписал значение на YES
        }
    }
    
    return result;
}

@end
