#import <XCTest/XCTest.h>
#import "NSDate+CustomDate.h"
#import "DateHelper.h"

@interface DateHelperTests : XCTestCase
@property (nonatomic, strong) DateHelper *dateHelper;
@end

@implementation DateHelperTests

- (void)setUp {
    self.dateHelper = [DateHelper new];
}

- (void)tearDown {
    self.dateHelper = NULL;
}

#pragma mark - First

- (void)test1 {
    NSString *expectedResult = @"January";
    NSString *actualResult = [self.dateHelper monthNameBy:1];
    XCTAssertEqualObjects(expectedResult, actualResult);
}

- (void)test2 {
    NSString *expectedResult = @"February";
    NSString *actualResult = [self.dateHelper monthNameBy:2];
    XCTAssertEqualObjects(expectedResult, actualResult);
}

- (void)test4 {
    NSString *actualResult = [self.dateHelper monthNameBy:0];
    XCTAssertNil(actualResult);
}

- (void)test5 {
    NSString *actualResult = [self.dateHelper monthNameBy:999];
    XCTAssertNil(actualResult);
}

#pragma mark - Second

- (void)test6 {
    NSString *date = @"2018-03-15T16:37:29Z";
    long expectedResult = 15;
    long actualResult = [self.dateHelper dayFromDate:date];
    XCTAssertEqual(expectedResult, actualResult);
}

- (void)test7 {
    NSString *date = @"2018-03-16T16:37:29Z";
    long expectedResult = 16;
    long actualResult = [self.dateHelper dayFromDate:date];
    XCTAssertEqual(expectedResult, actualResult);
}

- (void)test10 {
    NSString *date = @"2018-15-15T16:37:29Z";
    long expectedResult = 0;
    long actualResult = [self.dateHelper dayFromDate:date];
    XCTAssertEqual(expectedResult, actualResult);
}

#pragma mark - Third

- (void)test11 {
    NSString *dateString = @"19-May-2021";
    NSString *expectedResult = @"Ср";
    NSString *actualResult = [self.dateHelper getDayName:[NSDate dateFrom:dateString]];
    XCTAssertEqualObjects(expectedResult, actualResult);
}

- (void)test14 {
    NSString *dateString = @"32-May-2021";
    NSString *expectedResult;
    NSString *actualResult = [self.dateHelper getDayName:[NSDate dateFrom:dateString]];
    XCTAssertEqualObjects(expectedResult, actualResult);
}

- (void)test15 {
    NSString *expectedResult = @"Ср";
    NSString *actualResult = [self.dateHelper getDayName:[NSDate dateFrom:19
                                                                      month:5
                                                                      year:2021]];
    XCTAssertEqualObjects(expectedResult, actualResult);
}

#pragma mark - Fourth

- (void)test16 {
    BOOL expectedResult = YES;
    BOOL actualResult = [self.dateHelper isDateInThisWeek:[NSDate now]];
    XCTAssertEqual(expectedResult, actualResult);
}

- (void)test17 {
    BOOL expectedResult = NO;
    BOOL actualResult = [self.dateHelper isDateInThisWeek:[NSDate dateWithTimeIntervalSince1970:100]];
    XCTAssertEqual(expectedResult, actualResult);
}

- (void)test18 {
    BOOL expectedResult = NO;
    BOOL actualResult = [self.dateHelper isDateInThisWeek:[NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60 * 10]];
    XCTAssertEqual(expectedResult, actualResult);
}

- (void)test19 {
    BOOL expectedResult = NO;
    BOOL actualResult = [self.dateHelper isDateInThisWeek:[NSDate dateFrom:1
                                                                     month:5
                                                                     year:2021]];
    XCTAssertEqual(expectedResult, actualResult);
}

@end
