import UIKit

extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
}

extension UIColor {
    static let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let blackCoral = UIColor(red: 76.0 / 255.0, green: 92.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
    static let turquoiseGreen = UIColor(red: 145.0 / 255.0, green: 199.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
    static let venetianRed = UIColor(red: 194.0 / 255.0, green: 1.0 / 255.0, blue: 20.0 / 255.0, alpha: 1.0)
    static let black = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    static let littleBoyBlue = UIColor(red: 128.0 / 255.0, green: 164.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
}

extension String {
    static let pageTitle = "RSSchool"
    static let loginFieldPlaceholder = "Login"
    static let passwordFieldPlaceholder = "Password"
    static let authorizationButtonTitle = "Authorize"
}

extension UIFont {
    static let title = UIFont.systemFont(ofSize: 40.0, weight: .bold)
}

extension UIControl {
    func off() {
        isEnabled = false
        alpha = 0.3
    }
    
    func on() {
        isEnabled = true
        alpha = 1.0
    }
}
