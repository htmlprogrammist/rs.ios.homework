import Foundation

public extension Int {
    var roman: String? {
        if (self < 1 || self > 3999) {  // Constranumberss
            return nil
        }
        
        let numbersRoman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV"]
        let numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4]
        
        var result = ""
        var number = self
        
        for (i, n) in numbersRoman.enumerated() {
            if number >= numbers[i] {
                result = result + String(repeating: n, count: number/numbers[i])
                number = number - (number/numbers[i]) * numbers[i]
            }
        }
        if number < 4 {
            result = result + String(repeating: "I", count: number)
        }
        
        return result
    }
}
