import XCTest
@testable import ios_stage_task

class CoronaClassTests: XCTestCase {

    var coronaClass: CoronaClass!
    var seat0: Int = Int()
    var seat1: Int = Int()
    var seat2: Int = Int()
    var seat3: Int = Int()
    var seat4: Int = Int()
    var seat5: Int = Int()
    var seat6: Int = Int()
    var seat7: Int = Int()
    var seat8: Int = Int()
    var seat9: Int = Int()
    var seat10: Int = Int()
    var seat11: Int = Int()
    var seat12: Int = Int()
    var seat13: Int = Int()
    var seat14: Int = Int()
    var seat15: Int = Int()


    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {
        coronaClass = nil
    }
    
    func test1() {
        coronaClass = CoronaClass(n: 1)
        seat0 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0])
    }
    
    func test2() {
        coronaClass = CoronaClass(n: 1)
        seat0 = coronaClass.seat()
        coronaClass.leave(seat0)
        XCTAssertEqual(coronaClass.seats, [])
    }
    
    func test3() {
        coronaClass = CoronaClass(n: 2)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1])
    }
    
    func test4() {
        coronaClass = CoronaClass(n: 3)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 2])
    }
    
    func test5() {
        coronaClass = CoronaClass(n: 4)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1, 3])
    }
    
    func test6() {
        coronaClass = CoronaClass(n: 5)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1, 2, 4])
    }
    
    func test7() {
        coronaClass = CoronaClass(n: 7)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        seat4 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1, 2, 3, 6])
    }
    
    func test8() {
        coronaClass = CoronaClass(n: 10)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        coronaClass.leave(seat2)
        seat4 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 2, 5, 9])
    }
    
    func test9() {
        coronaClass = CoronaClass(n: 10)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        coronaClass.leave(seat1)
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        coronaClass.leave(seat3)
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        seat6 = coronaClass.seat()
        seat7 = coronaClass.seat()
        seat8 = coronaClass.seat()
        coronaClass.leave(seat6)
        seat9 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1, 2, 3, 4, 6, 9])
    }
    
    func test10() {
        coronaClass = CoronaClass(n: 10)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        seat6 = coronaClass.seat()
        seat7 = coronaClass.seat()
        seat8 = coronaClass.seat()
        seat9 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    }
    
    func test11() {
        coronaClass = CoronaClass(n: 20)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        coronaClass.leave(seat2)
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        seat6 = coronaClass.seat()
        coronaClass.leave(seat5)
        seat7 = coronaClass.seat()
        coronaClass.leave(seat1)
        seat8 = coronaClass.seat()
        seat9 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 3, 5, 7, 10, 14, 19])
    }
    
    func test12() {
        coronaClass = CoronaClass(n: 50)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        coronaClass.leave(seat2)
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        coronaClass.leave(seat3)
        seat6 = coronaClass.seat()
        coronaClass.leave(seat5)
        seat7 = coronaClass.seat()
        coronaClass.leave(seat1)
        seat8 = coronaClass.seat()
        seat9 = coronaClass.seat()
        seat10 = coronaClass.seat()
        coronaClass.leave(seat10)
        seat11 = coronaClass.seat()
        seat12 = coronaClass.seat()
        coronaClass.leave(seat4)
        seat13 = coronaClass.seat()
        seat14 = coronaClass.seat()
        seat15 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 3, 6, 12, 18, 24, 30, 36, 42, 49])
    }
    
    func test13() {
        coronaClass = CoronaClass(n: 75)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        coronaClass.leave(seat2)
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        coronaClass.leave(seat3)
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        coronaClass.leave(seat5)
        seat6 = coronaClass.seat()
        seat7 = coronaClass.seat()
        coronaClass.leave(seat1)
        seat8 = coronaClass.seat()
        seat9 = coronaClass.seat()
        coronaClass.leave(seat9)
        seat10 = coronaClass.seat()
        seat11 = coronaClass.seat()
        coronaClass.leave(seat11)
        seat12 = coronaClass.seat()
        seat13 = coronaClass.seat()
        seat14 = coronaClass.seat()
        seat15 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 9, 18, 27, 32, 37, 46, 55, 64, 74])
    }
    
    func test14() {
        coronaClass = CoronaClass(n: 100)
        seat0 = coronaClass.seat()
        seat1 = coronaClass.seat()
        seat2 = coronaClass.seat()
        seat3 = coronaClass.seat()
        seat4 = coronaClass.seat()
        seat5 = coronaClass.seat()
        seat6 = coronaClass.seat()
        seat7 = coronaClass.seat()
        coronaClass.leave(seat4)
        seat8 = coronaClass.seat()
        seat9 = coronaClass.seat()
        seat10 = coronaClass.seat()
        seat11 = coronaClass.seat()
        seat12 = coronaClass.seat()
        coronaClass.leave(seat10)
        seat13 = coronaClass.seat()
        seat14 = coronaClass.seat()
        seat15 = coronaClass.seat()
        XCTAssertEqual(coronaClass.seats, [0, 6, 12, 18, 24, 30, 36, 42, 49, 55, 61, 74, 86, 99])
    }
}
