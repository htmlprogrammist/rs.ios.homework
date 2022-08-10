import Foundation

class StockMaximize {
    func calcSub(array: [Int]) -> Int {
        var sum = 0
        let maxValue = array[array.count - 1]
        
        for price in array {
            if maxValue == price { break }
            sum += maxValue - price
        }
        return sum
    }
    
    func countProfit(prices: [Int]) -> Int {
        let len = prices.count
        if len < 1 {
            return 0
        }

        var counter = 0
        var result = 0
        var stocksToBuy: [Int] = []
        
        while true {
            let current = prices[counter]
            var next = -1
            
            stocksToBuy.append(current)
            
            if counter + 1 <= prices.count - 1 {
                next = prices[counter+1]
            }
            
            if current < stocksToBuy.last! || counter == prices.endIndex - 1 ||  next < current {
                result += calcSub(array: stocksToBuy)
                stocksToBuy.removeAll()
            }
            
            if counter == prices.endIndex - 1 { break }
            counter += 1
        }
        
        result = result < 0 ? 0: result
        return result
        
    }
}
