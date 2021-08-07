//
//  PaletteButton.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      08.07.2021
//

import UIKit

class PaletteButton: UIControl {
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 40.0, height: 40.0)
    }
    
    private lazy var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    var isOn: Bool = false {
        didSet {
            if isOn {
                self.select()
            } else {
                self.deselect()
            }
        }
    }
    
    private var smallWidthContraint: NSLayoutConstraint!
    private var smallHeightContraint: NSLayoutConstraint!

    private var wideWidthContraint: NSLayoutConstraint!
    private var wideHeightContraint: NSLayoutConstraint!
    
    private(set) var color: UIColor = .black
    
    init(_ color: UIColor) {
        super.init(frame: .zero)
        self.color = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.point(inside: point, with: event) {
            return self
        }
        return super.hitTest(point, with: event)
    }
    
    func setup() {
        smallWidthContraint = colorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
        smallHeightContraint = colorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        
        wideWidthContraint = colorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        wideHeightContraint = colorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9)
        
        backgroundColor = .white
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.cornerRadius = 10.0
        
        addSubview(colorView)
        NSLayoutConstraint.activate([
            smallWidthContraint,
            smallHeightContraint,
            colorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isOn.toggle()
    }
    
    private func select() {
        NSLayoutConstraint.deactivate([
            smallWidthContraint,
            smallHeightContraint
        ])
        
        NSLayoutConstraint.activate([
            wideWidthContraint,
            wideHeightContraint
        ])
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    private func deselect() {
        NSLayoutConstraint.deactivate([
            wideWidthContraint,
            wideHeightContraint
        ])
        
        NSLayoutConstraint.activate([
            smallWidthContraint,
            smallHeightContraint
        ])
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}
