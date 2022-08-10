import XCTest
@testable import ios_stage_task

class CardTests: XCTestCase {

    var card = Card(suit: .hearts, value: .nine)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIfCanBeatWhenTrump() throws {
        card.isTrump = true
        XCTAssertTrue(card.checkIfCanBeat(card: Card(suit: .diamonds, value: .ace, isTrump: false)))
        XCTAssertTrue(card.checkIfCanBeat(card: Card(suit: .hearts, value: .six, isTrump: true)))
        XCTAssertFalse(card.checkIfCanBeat(card: Card(suit: .hearts, value: .jack, isTrump: true)))
    }

    func testIfCanbeatWhenNotTrump() throws {
        card.isTrump = false
        XCTAssertFalse(card.checkIfCanBeat(card: Card(suit: .diamonds, value: .ace, isTrump: false)))
        XCTAssertFalse(card.checkIfCanBeat(card: Card(suit: .diamonds, value: .six, isTrump: true)))
        XCTAssertFalse(card.checkIfCanBeat(card: Card(suit: .hearts, value: .ace, isTrump: false)))
        XCTAssertTrue(card.checkIfCanBeat(card: Card(suit: .hearts, value: .six, isTrump: false)))
    }

}
