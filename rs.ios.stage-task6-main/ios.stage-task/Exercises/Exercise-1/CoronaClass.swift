import Foundation

class CoronaClass {
    var seats: [Int] {
        get {
            return self.seatsArr.sorted()
        }
        set {
            self.seatsArr = newValue
        }
    }
    var seatsArr = [Int]()
    var studentsNumber: Int

    init(n: Int) {
        self.studentsNumber = n
    }
    
    func seat() -> Int {
        var desk = 0
        var maxDistance = 0
        
        if self.seats.count < self.studentsNumber && self.seats.count != 0 {
            if (self.seats[0] == 0 && self.seats.count == 1) || self.seats.last != self.studentsNumber - 1 {
                desk = self.studentsNumber - 1
            }
            else {
                for i in 1..<self.seats.count {
                    if (self.seats[i] - self.seats[i - 1]) / 2 > maxDistance {
                        maxDistance = (self.seats[i] - self.seats[i - 1]) / 2
                        desk = self.seats[i - 1] + maxDistance
                    }
                }
            }
        }
        self.seats.append(desk)
        return desk
    }

    func leave(_ position: Int) {
        if let index = self.seats.firstIndex(of: position) {
            self.seats.remove(at: index)
        }
    }
}
