import XCTest
@testable import ios_stage_task

class StockMaximizeTests: XCTestCase {
    var stockMaximize: StockMaximize?

    override func setUpWithError() throws {
        stockMaximize = StockMaximize()
    }

    override func tearDownWithError() throws {
        stockMaximize = nil
    }

    func test1() throws {
        let result = stockMaximize?.countProfit(prices: [1, 2])
        let expectedResult = 1
        XCTAssertEqual(result, expectedResult)
    }

    func test2() throws {
        let result = stockMaximize?.countProfit(prices: [2, 1])
        let expectedResult = 0
        XCTAssertEqual(result, expectedResult)
    }

    func test3() throws {
        let result = stockMaximize?.countProfit(prices: [1, 7, 3, 5])
        let expectedResult = 8
        XCTAssertEqual(result, expectedResult)
    }

    func test4() throws {
        let result = stockMaximize?.countProfit(prices: [1, 7, 7, 8])
        let expectedResult = 9
        XCTAssertEqual(result, expectedResult)
    }

    func test5() throws {
        let result = stockMaximize?.countProfit(prices: [1, 7, 7, 3])
        let expectedResult = 6
        XCTAssertEqual(result, expectedResult)
    }

    func test6() throws {
        let result = stockMaximize?.countProfit(prices: [1, 2, 2, 2, 2])
        let expectedResult = 1
        XCTAssertEqual(result, expectedResult)
    }

    func test7() throws {
        let result = stockMaximize?.countProfit(prices: [2, 2, 2, 2, 3])
        let expectedResult = 4
        XCTAssertEqual(result, expectedResult)
    }

    func test8() throws {
        let result = stockMaximize?.countProfit(prices: [2, 2, 2, 2, 1])
        let expectedResult = 0
        XCTAssertEqual(result, expectedResult)
    }

    func test9() throws {
        let result = stockMaximize?.countProfit(prices: [8, 2, 3, 5, 4, 5])
        let expectedResult = 6
        XCTAssertEqual(result, expectedResult)
    }

    func test10() throws {
        let result = stockMaximize?.countProfit(prices: [])
        let expectedResult = 0
        XCTAssertEqual(result, expectedResult)
    }

    func test11() throws {
        let result = stockMaximize?.countProfit(prices: [0])
        let expectedResult = 0
        XCTAssertEqual(result, expectedResult)
    }

    func test12() throws {
        let result = stockMaximize?.countProfit(prices: [5, 5, 5])
        let expectedResult = 0
        XCTAssertEqual(result, expectedResult)
    }
}
