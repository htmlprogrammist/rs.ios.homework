//
//  Helpers.swift
//  RSSchool_T8
//
//  Created by Uladzislau Volchyk on 8.07.21.
//

import UIKit

extension UIColor {
    static let lightGreenSea: UIColor = UIColor(red: 33.0 / 255.0, green: 176.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0)
    static let chillSky: UIColor = UIColor(red: .zero, green: 178.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    static let quarterBlack: UIColor = UIColor(red: .zero, green: .zero, blue: .zero, alpha: 0.25)
}

extension UIView {
    func asImage() -> Data {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.pngData { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIFont {
    enum Prettiness: String {
        case regular
        case medium
    }
    
    static func montserrat(_ size: CGFloat, _ type: Prettiness) -> UIFont {
        UIFont(name: "Montserrat-\(type.rawValue.capitalized)", size: size) ?? .systemFont(ofSize: size)
    }
}
