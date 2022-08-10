//
//  ActionButton.swift
//  RSSchool_T8
//
//  Created by Uladzislau Volchyk on 8.07.21.
//

import UIKit

class ActionButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setTitleColor(.lightGreenSea, for: .normal)
        backgroundColor = .white
        layer.shadowColor = UIColor.quarterBlack.cgColor
        layer.shadowRadius = 1
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 21.0, bottom: 5.0, right: 21.0)
        layer.cornerRadius = 10.0
        
        let font = UIFont.montserrat(18.0, .medium)
        titleLabel?.font = font
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.transition(with: self, duration: 0.2, options: [.transitionCrossDissolve]) { [self] in
                if isHighlighted {
                    layer.shadowRadius = 2.0
                    layer.shadowColor = UIColor.lightGreenSea.cgColor
                } else {
                    layer.shadowRadius = 1.0
                    layer.shadowColor = UIColor.quarterBlack.cgColor
                }
            }
        }
    }
    
}

// MARK: -

final class DrawingButton: ActionButton {
    
    override func setup() {
        super.setup()
        contentEdgeInsets = UIEdgeInsets(top: 9.0, left: 47.0, bottom: 9.0, right: 47.0)
    }
}
