#import <XCTest/XCTest.h>
#import "PlayersSeparator.h"

@interface PlayersSeparatorTest : XCTestCase

@property (nonatomic, strong) PlayersSeparator *separator;

@end

@implementation PlayersSeparatorTest

- (void)setUp {
    self.separator = [PlayersSeparator new];
}

- (void)tearDown {
    self.separator = nil;
}

- (void)test0 {
    NSArray *input = nil;
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test1 {
    NSArray *input = @[];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test2 {
    NSArray *input = @[@0];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test3 {
    NSArray *input = @[@1];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test4 {
    NSArray *input = @[@1,@2];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test5 {
    NSArray *input = @[@2,@1];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test6 {
    NSArray *input = @[@1,@2,@3];
    NSInteger result = 1;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test7 {
    NSArray *input = @[@3,@2,@1];
    NSInteger result = 1;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test8 {
    NSArray *input = @[@2,@1,@3];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test9 {
    NSArray *input = @[@1,@3,@2];
    NSInteger result = 0;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test10 {
    NSArray *input = @[@1,@2,@3,@4];
    NSInteger result = 4;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test11 {
    NSArray *input = @[@9,@5,@6,@4];
    NSInteger result = 2;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test12 {
    NSArray *input = @[@2,@5,@3,@4,@1];
    NSInteger result = 3;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test13 {
    NSArray *input = @[@5,@6,@4,@3,@7,@0,@9,@8,@1,@2];
    NSInteger result = 31;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test14 {
    NSArray *input = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
    NSInteger result = 120;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test15 {
    NSArray *input = @[@9,@8,@7,@6,@5,@4,@3,@2,@1,@0];
    NSInteger result = 120;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

- (void)test16 {
    NSArray *input = @[@24120,@30401,@54031,@14990,@102939,@4911,@3991200,@841932,@932198314];
    NSInteger result = 40;
    XCTAssertTrue(result == [self.separator dividePlayersIntoTeams: input]);
}

@end
