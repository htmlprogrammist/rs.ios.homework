#import <XCTest/XCTest.h>
#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimalTests : XCTestCase
@property (nonatomic, strong) LexicographicallyMinimal *lexicographicallyMinimal;
@end

@implementation LexicographicallyMinimalTests

- (void)setUp {
    self.lexicographicallyMinimal = [LexicographicallyMinimal new];
}

- (void)tearDown {
    self.lexicographicallyMinimal = NULL;
}

- (void)test1 {
    NSString *string1 = @"ACA";
    NSString *string2 = @"BCF";
    NSString *resultString = @"ABCACF";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

- (void)test2 {
    NSString *string1 = @"AAA";
    NSString *string2 = @"BCF";
    NSString *resultString = @"AAABCF";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

- (void)test3 {
    NSString *string1 = @"ABC";
    NSString *string2 = @"ABC";
    NSString *resultString = @"AABBCC";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

- (void)test4 {
    NSString *string1 = @"ABCDD";
    NSString *string2 = @"ABC";
    NSString *resultString = @"AABBCCDD";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

- (void)test5 {
    NSString *string1 = @"ABCD";
    NSString *string2 = @"ABCF";
    NSString *resultString = @"AABBCCDF";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

- (void)test7 {
    NSString *string1 = @"JACK";
    NSString *string2 = @"DANIEL";
    NSString *resultString = @"DAJACKNIEL";
    XCTAssertEqualObjects(resultString, [self.lexicographicallyMinimal findLexicographicallyMinimalForString1: string1 andString2:string2]);
}

@end
