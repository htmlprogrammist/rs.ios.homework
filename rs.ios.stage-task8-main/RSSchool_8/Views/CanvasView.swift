//
//  CanvasView.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      07.07.2021
//

import UIKit

final class CanvasView: UIView {
    
    lazy var shape_1: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.lineWidth = 1.0
        return layer
    }()

    lazy var shape_2: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.lineWidth = 1.0
        return layer
    }()

    lazy var shape_3: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.lineWidth = 1.0
        return layer
    }()

    var layers: [CAShapeLayer] {
        [shape_1, shape_2, shape_3]
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.chillSky.withAlphaComponent(0.25).cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 4.0
        layer.cornerRadius = 8.0
        layer.shadowOpacity = 1.0
        backgroundColor = .white
        
        layer.addSublayer(shape_1)
        layer.addSublayer(shape_2)
        layer.addSublayer(shape_3)
    }
    
    func provideColors(_ colors: [UIColor]) {
        var colors = colors
        while colors.count != 3 {
            colors.append(.black)
        }
        for (index, color) in colors.enumerated() {
            layers[index].strokeColor = color.cgColor
        }
    }
    
    func prepare(_ template: PathTemplate) {
        shape_1.path = template.path_1
        shape_2.path = template.path_2
        shape_3.path = template.path_3
    }
}

