//
//  ModalViewController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      08.07.2021
//

import UIKit

final class PaletteViewController: ModalViewController {
    
    var callback: (([UIColor]) -> ())?
    
    lazy var saveButton: ActionButton = {
        let button = ActionButton()
        
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveAction(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let topRow: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        return stackView
    }()
    
    let botRow: UIStackView = {
        let stackView = UIStackView()
        
        
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let colors: [UIColor] = [
        #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    ]
    
    private var selectedColors: [UIColor] = []
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0)
        ])
        
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        colors.prefix(6).forEach {
            topRow.addArrangedSubview(buildButton($0))
        }
        colors.suffix(6).forEach {
            botRow.addArrangedSubview(buildButton($0))
        }
        
        verticalStack.addArrangedSubview(topRow)
        verticalStack.addArrangedSubview(botRow)
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 20.0
        
        view.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17.0),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.0),
            verticalStack.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30.0)
        ])
    }
    
    @objc func saveAction(_ sender: ActionButton) {
        callback?(selectedColors)
    }
    
    func buildButton(_ color: UIColor) -> PaletteButton {
        let button = PaletteButton(color)
        button.addTarget(self, action: #selector(paletteButtonHandler(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func paletteButtonHandler(_ button: PaletteButton) {
        if button.isOn {
            selectedColors.removeAll { $0 == button.color }
        } else {
            if selectedColors.count == 3,
               let first = selectedColors.first {
                (topRow.arrangedSubviews + botRow.arrangedSubviews).forEach { view in
                    if let button = view as? PaletteButton,
                       button.color == first {
                        button.isOn = false
                    }
                }
                selectedColors.removeAll { $0 == first }
            }
            selectedColors.append(button.color)
            view.backgroundColor = button.color
            setupBackgroundTimer()
        }
    }
    
    func setupBackgroundTimer() {
        timer?.invalidate()
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self] timer in
            view.backgroundColor = .white
            timer.invalidate()
        }
        self.timer = timer
        RunLoop.current.add(timer, forMode: .common)
    }
}
