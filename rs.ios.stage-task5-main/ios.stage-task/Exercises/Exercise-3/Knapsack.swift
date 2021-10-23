import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        maxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func maxKilometres() -> Int {
        let foodLength = foods.count
        let drinkLength = drinks.count
        
        let food = knapSack(limit: maxWeight, wt: foods, value: foods, n: foodLength)
        let drink = knapSack(limit: maxWeight, wt: drinks, value: drinks, n: drinkLength)
        var maxKilometres: [Int] = []
        
        for i in 0...maxWeight {
            maxKilometres.append(min(food[foodLength][i], drink[drinkLength][maxWeight-i]))
        }
        return maxKilometres.max() ?? 0
    }
    
    func knapSack(limit: Int, wt: [Supply], value: [Supply], n: Int) -> [[Int]] {
        var array = Array(repeating: Array(repeating: 0, count: limit + 1), count: n + 1)
        
        for i in 0...n {
            for j in 0...limit {
                if i == 0 || j == 0 {
                    array[i][j] = 0
                } else if wt[i - 1].weight <= j {
                    array[i][j] = max(value[i - 1].value + array[i - 1][j - wt[i - 1].weight],  array[i - 1][j]);
                } else {
                    array[i][j] = array[i - 1][j]
                }
            }
        }
        return array
    }
}
