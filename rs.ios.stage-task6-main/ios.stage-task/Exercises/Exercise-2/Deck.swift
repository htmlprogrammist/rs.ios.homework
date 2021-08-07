import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        []
    }

    public func shuffle() {

    }

    public func defineTrump() {

    }

    public func initialCardsDealForPlayers(players: [Player]) {

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

