//
//  ArtistViewController.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      05.07.2021
//

import UIKit

class ArtistViewController: UIViewController {
    
    enum State {
        case idle
        case drawing
        case done
    }
    
    private lazy var canvasView: CanvasView = {
        let view = CanvasView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        return view
    }()
    
    private lazy var paletteButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Open Palette", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(paletteAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var timerButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Open Timer", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(timerAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var drawResetButton: ActionButton = {
        let button = ActionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(drawResetAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: ActionButton = {
        let button = ActionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(shareImage(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var paletteViewController: PaletteViewController = {
        let controller = PaletteViewController()
        controller.callback = { colors in
            self.canvasView.provideColors(colors)
            self.hideChild(controller)
        }
        return controller
    }()
    
    private lazy var timerViewController: TimerViewController = {
        let controller = TimerViewController()
        controller.callback = { time in
            self.time = TimeInterval(time)
            self.hideChild(controller)
        }
        return controller
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Drawings", style: .plain, target: self, action: #selector(showDrawings))
        button.setTitleTextAttributes([.font: UIFont.montserrat(17.0, .regular)], for: .normal)
        button.setTitleTextAttributes([.font: UIFont.montserrat(17.0, .regular)], for: .highlighted)
        return button
    }()
    
    private let drawingsController = DrawingsViewController()
    
    var timer: Timer?
    var time: TimeInterval = 1
    var state: State = .idle
    var fireDate: Date?
}

// MARK: - UIViewController overrides

extension ArtistViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Artist"
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(canvasView)
        view.addSubview(paletteButton)
        view.addSubview(timerButton)
        view.addSubview(drawResetButton)
        view.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvasView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0),
            
            paletteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            paletteButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 50.0),
            
            drawResetButton.leadingAnchor.constraint(equalTo: paletteButton.trailingAnchor, constant: 60.0),
            drawResetButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 50.0),
            
            timerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            timerButton.topAnchor.constraint(equalTo: paletteButton.bottomAnchor, constant: 20.0),
            
            shareButton.trailingAnchor.constraint(lessThanOrEqualTo: drawResetButton.trailingAnchor),
            shareButton.topAnchor.constraint(equalTo: drawResetButton.bottomAnchor, constant: 20.0)
        ])
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        setupIdleState()
    }
}

// MARK: - Private interface

private extension ArtistViewController {
    
    enum Constants {
        static let interval: TimeInterval = 1 / 60
        static let step: (TimeInterval) -> CGFloat = { time in CGFloat(1 / (60 * time))}
    }
    
    @objc func paletteAction(_ sender: ActionButton) {
        showChild(paletteViewController)
    }
    
    @objc func timerAction(_ sender: ActionButton) {
        showChild(timerViewController)
    }
    
    @objc func drawResetAction(_ sender: ActionButton) {
        
        if state == .idle {
            canvasView.prepare(PathMaster.shared.template)
            setupDrawState()
            timer?.invalidate()
            
            let timer = Timer.scheduledTimer(withTimeInterval: Constants.interval, repeats: true) { [self] (timer) in
                if let fireDate = self.fireDate,
                   Date().timeIntervalSince1970 - fireDate.timeIntervalSince1970 <= time {
                    canvasView.shape_1.strokeEnd += Constants.step(time)
                    canvasView.shape_2.strokeEnd += Constants.step(time)
                    canvasView.shape_3.strokeEnd += Constants.step(time)
                } else {
                    timer.invalidate()
                    setupDoneState()
                }
            }
            self.timer = timer
            self.fireDate = Date()
            RunLoop.current.add(timer, forMode: .common)
        } else {
            setupIdleState()
        }
    }
    
    @objc func showDrawings() {
        navigationController?.pushViewController(drawingsController, animated: true)
    }
    
    func showChild(_ controller: UIViewController) {
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(controller)
        view.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.centerYAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        controller.didMove(toParent: self)
    }
    
    func hideChild(_ controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }
    
    @objc func shareImage(_ sender: ActionButton) {
        let image = canvasView.asImage()
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activity, animated: true)
    }
}

// MARK: - Drawing Logic

private extension ArtistViewController {
    
    func setupIdleState() {
        state = .idle
        
        drawResetButton.setTitle("Draw", for: .normal)
        
        timerButton.isEnabled = true
        paletteButton.isEnabled = true
        shareButton.isEnabled = false
        
        timerButton.alpha = 1.0
        paletteButton.alpha = 1.0
        shareButton.alpha = 0.5
        
        canvasView.shape_1.strokeEnd = .zero
        canvasView.shape_2.strokeEnd = .zero
        canvasView.shape_3.strokeEnd = .zero
    }
    
    func setupDrawState() {
        state = .drawing
        
        timerButton.isEnabled = false
        paletteButton.isEnabled = false
        drawResetButton.isEnabled = false
        
        timerButton.alpha = 0.5
        paletteButton.alpha = 0.5
        drawResetButton.alpha = 0.5
    }
    
    func setupDoneState() {
        state = .done
        
        drawResetButton.setTitle("Reset", for: .normal)
        
        drawResetButton.isEnabled = true
        shareButton.isEnabled = true
        
        drawResetButton.alpha = 1.0
        shareButton.alpha = 1.0
    }
}
