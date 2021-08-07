import XCTest
@testable import ios_stage_task

final class DeckTests: XCTestCase {
    var deck: Deck = Deck(with: .deck36)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShuffleCards() throws {
        let initialDeck = deck
        deck.shuffle()
        XCTAssertNotEqual(deck.cards, initialDeck.cards)
    }

    func testDefineTrump() throws {
        deck.defineTrump()
        XCTAssertNotNil(self.deck.trump)
        for card in deck.cards {
            if card.suit == deck.trump {
                XCTAssertTrue(card.isTrump)
            } else {
                XCTAssertFalse(card.isTrump)
            }
        }
    }

    func testCreateDeck36() throws {
        XCTAssertEqual(deck.cards.count, 36)

        if let actualCard = deck.cards.first {
            let expectedCard = Card(suit: .clubs, value: .six, isTrump: false)
            XCTAssertEqual(expectedCard, actualCard)
        }

        if let actualCard = deck.cards.last {
            let expectedCard = Card(suit: .diamonds, value: .ace, isTrump: false)
            XCTAssertEqual(expectedCard, actualCard)
        }
    }

    func testInitialCardsDealForPlayers() throws {
        XCTAssertEqual(deck.cards.count, 36)

        let firstPlayer = Player()
        XCTAssertEqual(firstPlayer.hand, nil)

        let secondPlayer = Player()
        XCTAssertEqual(secondPlayer.hand, nil)

        deck.initialCardsDealForPlayers(players: [firstPlayer, secondPlayer])
        XCTAssertEqual(deck.cards.count, 24)

        XCTAssertTrue(firstPlayer.hand != nil)

        XCTAssertTrue(secondPlayer.hand != nil)
    }

}
