//
//  DrawingsViewController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      11.07.2021
//

import UIKit

class DrawingsViewController: UIViewController {

    private lazy var planetButton: DrawingButton = {
        let button = DrawingButton()
        button.setTitle("Planet", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var headButton: DrawingButton = {
        let button = DrawingButton()
        button.setTitle("Head", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var treeButton: DrawingButton = {
        let button = DrawingButton()
        button.setTitle("Tree", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var landscapeButton: DrawingButton = {
        let button = DrawingButton()
        button.setTitle("Landscape", for: .normal)
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.addArrangedSubview(planetButton)
        stackView.addArrangedSubview(headButton)
        stackView.addArrangedSubview(treeButton)
        stackView.addArrangedSubview(landscapeButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        navigationItem.title = "Drawings"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupHighlights()
    }
    
    @objc func handleButton(_ button: DrawingButton) {
        if button === headButton {
            PathMaster.shared.template = HeadPath()
        } else if button === landscapeButton {
            PathMaster.shared.template = LandscapePath()
        } else if button === treeButton {
            PathMaster.shared.template = TreePath()
        } else {
            PathMaster.shared.template = PlanetPath()
        }
                    
        headButton.isHighlighted = false
        landscapeButton.isHighlighted = false
        treeButton.isHighlighted = false
        planetButton.isHighlighted = false
        navigationController?.popViewController(animated: true)
    }
    
    func setupHighlights() {
        headButton.isHighlighted = PathMaster.shared.template is HeadPath
        landscapeButton.isHighlighted = PathMaster.shared.template is LandscapePath
        treeButton.isHighlighted = PathMaster.shared.template is TreePath
        planetButton.isHighlighted = PathMaster.shared.template is PlanetPath
    }
    
}
