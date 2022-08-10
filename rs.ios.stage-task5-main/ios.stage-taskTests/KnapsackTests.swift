import XCTest
@testable import ios_stage_task

class KnapsackTests: XCTestCase {

    var sol: Knapsack!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }

    // MARK: - MAX Weight 10
    func test1() {
        caseMaxWeight10_1()
        caseMaxWeight10_2()
        caseMaxWeight10_3()
        caseMaxWeight10_4()
        caseMaxWeight10_5()
        caseMaxWeight10_6()
        caseMaxWeight10_7()
        caseMaxWeight10_8()
    }

    fileprivate func caseMaxWeight10_1() {
        let maxWeight = 10
        let foods: [Supply] = [(5, 1)]
        let drinks: [Supply] = [(5, 2)]
        let sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 1)
    }
    fileprivate func caseMaxWeight10_2() {
        let maxWeight = 10
        let foods: [Supply] = [(5, 1)]
        let drinks: [Supply] = [(6, 1)]
        let sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 0)
    }

    fileprivate func caseMaxWeight10_3() {
        let maxWeight = 10
        let foods = [(5, 3)]
        let drinks = [(3, 2), (2, 1)]
        let sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 3)
    }

    fileprivate func caseMaxWeight10_4() {
        let maxWeight = 10
        let foods: [Supply] = [(6, 7), (5, 4)]
        let drinks: [Supply] = [(4, 6), (5, 9)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 6)
    }

    fileprivate func caseMaxWeight10_5() {
        let maxWeight = 10
        let foods: [Supply] = [(4, 7), (1, 2)]
        let drinks: [Supply] = [(1, 2), (2, 3)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 5)
    }

    fileprivate func caseMaxWeight10_6() {
        let maxWeight = 10
        let foods: [Supply] = [(4, 7), (1, 2)]
        let drinks: [Supply] = [(5, 3),]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 3)
    }

    fileprivate func caseMaxWeight10_7() {
        let maxWeight = 10
        let foods: [Supply] = [(1, 1), (2, 2), (3, 3), (4, 4), (5, 15)]
        let drinks: [Supply] = [(7, 10), (6, 9), (4, 3)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 4)
    }

    fileprivate func caseMaxWeight10_8() {
        let maxWeight = 10
        let foods: [Supply] = [(2, 1), (3, 1), (5, 4)]
        let drinks: [Supply] = [(2, 7), (5, 9), (6, 10)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 5)
    }

    // MARK: - Max Weigth 100

    func test2() {
        let maxWeight = 100
        let foods: [Supply] = [(46, 71), (1, 2)]
        let drinks: [Supply] = [(79, 65), (84, 23)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 2)
    }

    func test3() {
        let maxWeight = 100
        let foods: [Supply] = [(46, 71), (1, 2)]
        let drinks: [Supply] = [(79, 65), (84, 23), (50, 14)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 14)
    }

    // MARK: -  Max Weight 120
    func test4() {
        let maxWeight = 120
        let foods: [Supply] = [
            (48, 81),
            (43, 35), // +
            (32, 93), // +
            (45, 24),
            (87, 46),
        ] // + total 75
        let drinks: [Supply] = [
            (68, 27),
            (89, 95),
            (98, 12),
            (13, 60), // +
            (12, 68), // +
        ]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 128)
    }

    func test5() {
        let maxWeight = 120
        let foods: [Supply] = [
            (14, 53), // +
            (84, 62),
            (64, 44),
            (4, 21), // +
            (86, 37),
            (95, 48),
            (28, 61), // +
            (16, 43),
            (96, 67),
            (46, 99), // +
            (59, 42),
            (71, 30),
            (38, 18),
        ] // + total 92
        let drinks: [Supply] = [
            (14, 95), // +
            (81, 60),
            (9, 74), // +
            (5, 51), // +
            (73, 38),
            (79, 73),
            (65, 53),
            (17, 92),
            (15, 97),
            (76, 45),
            (29, 2),
            (16, 94),
            (40, 48),
            (36, 77),
            (10, 28),
        ]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 220)
    }

    // MARK: -  Max Weight 123
    func test6() {
        let maxWeight = 123
        let foods: [Supply] = [(46, 71), (37, 41)]
        let drinks: [Supply] = [(79, 65), (84, 23)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 41)
    }

    func test7() {
        let maxWeight = 123
        let foods: [Supply] = [(46, 71), (37, 41), (1, 2)]
        let drinks: [Supply] = [(79, 65), (84, 23)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 43)
    }

    // MARK: - 
    
    func test8() {
        let maxWeight = 240
        let foods: [Supply] = [
            (51, 34), // +
            (96, 39),
            (10, 80), // +
            (44, 63), // +
            (32, 75), // +
            (5, 20),
            (22, 32), // +
            (33, 12),
        ] // + total 159
        let drinks: [Supply] = [
            (8, 75), // +
            (31, 64), // +
            (19, 45),
            (1, 58), // +
            (28, 54),
            (92, 20),
            (58, 97),
            (76, 4),
            (37, 88), // +
            (72, 53),
        ]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 284)
    }

    func testMaxWeight1000() {
        let exp = expectation(description: #function)
        DispatchQueue.global().async {
            self.caseMaxWeight1000()
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)
    }

    func testMaxWeight1500() {
        let exp = expectation(description: #function)
        DispatchQueue.global().async {
            self.caseMaxWeight1500()
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)
    }

    func testMaxWeight2500() {
        let exp = expectation(description: #function)
        DispatchQueue.global().async {
            self.caseMaxWeight2500()
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3)
    }

    fileprivate func caseMaxWeight1000() {
        let maxWeight = 1000
        let foods: [Supply] = [
            (13, 17),(34, 57),(89, 47),(85, 65),(20, 38),(100, 66),(10, 56),(51, 14),(87, 70),(43, 29),(63, 99),(45, 5),(67, 50),(66, 42),(76, 26),(27, 82),(35, 53),(24, 89),(29, 59),(96, 49),(95, 10),
            (72, 76),(92, 61),(47, 83),(26, 87),(79, 33),(62, 85),(84, 75),(16, 32),(64, 52),(38, 64),(71, 88),(32, 91),(94, 16),(30, 68),(68, 80),(65, 7),(11, 35),(36, 45),(77, 24),(58, 73),(56, 31),(21, 67),(44, 27),(22, 13),(91, 18),(81, 94),(50, 36),(93, 97),(33, 41),(78, 69),(73, 90),(12, 39),(57, 63)]
        let drinks: [Supply] = [
            (99, 32), (18, 18), (96, 62), (48, 82), (55, 42), (94, 36), (16, 10), (72, 28), (92, 78), (69, 84), (58, 81), (34, 34), (12, 71), (63, 77), (78, 29), (14, 25), (62, 30), (64, 11), (79, 67), (52, 17), (46, 31), (31, 13), (61, 74), (53, 99), (36, 58), (42, 39), (100, 15), (32, 37), (74, 41), (71, 22), (59, 35), (19, 1), (76, 79), (10, 93), (85, 48), (88, 20), (65, 19), (25, 69), (98, 14), (5, 6), (24, 100), (45, 76), (17, 46), (23, 80), (84, 16), (80, 26), (43, 9), (67, 49), (51, 7), (60, 53), (15, 91), (28, 45), (75, 33), (83, 60), (38, 87), (13, 27), (70, 96), (68, 64), (90, 8), (44, 52)]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 1151)
    }

    fileprivate func caseMaxWeight1500() {
        let maxWeight = 1500
        let foods: [Supply] = [
            (8, 95), (67, 70), (84, 98), (58, 92), (63, 35), (85, 67), (30, 17), (35, 74), (37, 50), (50, 85), (20, 48), (82, 54), (34, 21), (33, 30), (96, 33), (51, 78), (32, 45), (29, 64), (40, 69), (53, 39), (68, 68), (14, 73), (83, 22), (55, 60), (5, 47), (41, 53), (16, 23), (86, 6), (94, 7), (15, 28), (13, 80), (71, 77), (52, 31), (72, 66), (70, 41), (10, 93), (56, 58), (60, 2), (88, 15), (9, 87), (54, 34), (43, 40), (45, 4), (87, 83), (91, 5), (89, 86), (26, 24), (48, 18), (31, 14), (97, 100), (66, 13), (49, 32), (64, 29), (18, 44), (19, 88), (22, 8), (78, 99), (46, 65), (24, 1), (77, 57), (62, 42), (17, 76), (44, 82), (11, 9), (42, 97), (57, 49), (79, 37), (47, 52), (12, 3)
        ]
        let drinks: [Supply] = [
            (67, 97), (6, 8), (63, 28), (58, 35), (100, 13), (84, 59), (1, 50), (30, 20), (69, 27), (37, 10), (82, 81), (33, 40), (34, 92), (96, 91), (90, 51), (29, 39), (93, 58), (68, 53), (14, 42), (75, 72), (4, 71), (53, 34), (95, 22), (5, 3), (16, 64), (86, 56), (94, 75), (71, 80), (13, 60), (65, 94), (52, 86), (72, 1), (2, 33), (70, 66), (38, 46), (10, 61), (56, 25), (88, 85), (45, 15), (87, 63), (3, 95), (89, 26), (26, 99), (31, 2), (97, 17), (36, 57), (66, 68), (49, 65), (99, 62), (21, 87), (64, 4), (80, 7), (22, 73), (19, 24), (78, 76), (62, 6), (17, 90), (44, 100), (11, 41), (42, 18), (47, 5), (79, 9), (27, 93), (57, 78), (12, 38)
        ]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 1787)
    }

    fileprivate func caseMaxWeight2500() {
        let maxWeight = 2500
        let foods: [Supply] = [
            (58, 96), (75, 55), (14, 54), (6, 13), (48, 24), (51, 73), (20, 36), (35, 71), (69, 70), (99, 25), (1, 41), (46, 27), (76, 56), (15, 80), (41, 5), (96, 72), (36, 69), (62, 30), (63, 90), (8, 28), (67, 53), (19, 49), (16, 21), (42, 48), (79, 67), (85, 94), (44, 38), (54, 17), (29, 74), (32, 19), (45, 61), (65, 78), (60, 47), (92, 60), (94, 50), (18, 8), (40, 66), (39, 4), (49, 92), (43, 59), (47, 37), (66, 16), (23, 93), (80, 58), (28, 46), (55, 22), (4, 65), (37, 12), (70, 11), (9, 18), (57, 43), (50, 44), (59, 2), (34, 88), (87, 9), (21, 98), (88, 1), (2, 91), (81, 82)
        ]
        let drinks: [Supply] = [
            (5, 29), (58, 39), (100, 35), (14, 54), (6, 24), (64, 36), (12, 73), (24, 87), (17, 68), (20, 71), (35, 25), (69, 7), (11, 27), (53, 56), (3, 80), (82, 5), (99, 72), (46, 69), (86, 90), (41, 64), (78, 28), (36, 52), (62, 49), (63, 45), (8, 94), (52, 67), (67, 17), (26, 74), (19, 61), (16, 19), (31, 78), (79, 32), (91, 33), (84, 47), (85, 84), (33, 50), (44, 10), (29, 8), (32, 4), (60, 77), (49, 92), (47, 59), (43, 81), (39, 100), (66, 16), (23, 85), (80, 93), (27, 31), (28, 37), (55, 46), (74, 12), (30, 79), (37, 65), (70, 22), (4, 83), (50, 18), (25, 20), (95, 43), (59, 44), (34, 88), (87, 9), (88, 1), (93, 82), (81, 97), (98, 14)
        ]
        sol = Knapsack(maxWeight, foods, drinks)
        XCTAssertEqual(sol.maxKilometers, 2278)
    }

}
