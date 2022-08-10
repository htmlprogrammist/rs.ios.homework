//
//  TimerViewController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      08.07.2021
//

import UIKit

class TimerViewController: ModalViewController {
    
    var callback: ((Float) -> ())?
    
    lazy var saveButton: ActionButton = {
        let button = ActionButton()
        
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveAction(_:)), for: .touchUpInside)
        
        return button
    }()

    lazy var sliderView: UISlider = {
        let slider = UISlider()
        slider.tintColor = .lightGreenSea
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.addTarget(self, action: #selector(sliderValueChange(_:)), for: .valueChanged)
        return slider
    }()
    
    lazy var leftTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.0"
        return label
    }()
    
    lazy var rightTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5.0"
        return label
    }()
    
    lazy var centerTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1.00"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(saveButton)
        view.addSubview(sliderView)
        view.addSubview(leftTimeLabel)
        view.addSubview(rightTimeLabel)
        view.addSubview(centerTimeLabel)
        
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0),
            sliderView.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30.0),
            sliderView.leadingAnchor.constraint(equalTo: leftTimeLabel.trailingAnchor, constant: 20.0),
            sliderView.trailingAnchor.constraint(equalTo: rightTimeLabel.leadingAnchor, constant: -20.0),
            
            leftTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            leftTimeLabel.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            
            rightTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            rightTimeLabel.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            
            centerTimeLabel.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            centerTimeLabel.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: 25.0)
        ])
    }
    
    @objc func saveAction(_ sender: ActionButton) {
        callback?(sliderView.value)
    }
    
    @objc func sliderValueChange(_ slider: UISlider) {
        centerTimeLabel.text = String(format: "%.2f", slider.value)
    }
}
