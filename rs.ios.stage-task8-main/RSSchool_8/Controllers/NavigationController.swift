//
//  NavigationController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      08.07.2021
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
        
        let font = UIFont.montserrat(17.0, .regular)
        navigationBar.titleTextAttributes = [
            .font : font
        ]
    }
}
