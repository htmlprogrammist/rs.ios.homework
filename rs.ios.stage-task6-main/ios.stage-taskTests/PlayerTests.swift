import XCTest
@testable import ios_stage_task

final class PlayerTests: XCTestCase {
    let player = Player()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIfCanTossWhenAttacking() throws {
        player.hand = [Card(suit: .clubs, value: .six), Card(suit: .diamonds, value: .seven), Card(suit: .hearts, value: .eight)]
        XCTAssertTrue(player.checkIfCanTossWhenAttacking(card: Card(suit: .spades, value: .six)))
        XCTAssertFalse(player.checkIfCanTossWhenAttacking(card: Card(suit: .spades, value: .nine)))
    }

    func testIfCanTossWhenTossing() throws {
        player.hand = [Card(suit: .clubs, value: .six), Card(suit: .diamonds, value: .seven), Card(suit: .hearts, value: .eight)]
        XCTAssertTrue(player.checkIfCanTossWhenTossing(table: [Card(suit: .clubs, value: .seven): Card(suit: .clubs, value: .ace)]))
        XCTAssertFalse(player.checkIfCanTossWhenTossing(table: [Card(suit: .clubs, value: .nine): Card(suit: .clubs, value: .ace)]))
    }
}
