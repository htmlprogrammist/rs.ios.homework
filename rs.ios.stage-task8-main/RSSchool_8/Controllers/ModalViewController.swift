//
//  ModalViewController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      08.07.2021
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = .zero
        view.layer.shadowColor = UIColor.quarterBlack.cgColor
        view.layer.cornerRadius = 40.0
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
    }
}
