import UIKit

enum CypherCases: Int {
    case one = 1, two, three
}

class ViewController: UIViewController {
    
    private let correctCypherCode: [CypherCases] = [.one, .three, .two]
    private let correctLogin: String = "login"
    private let correctPassword: String = "password"
    
    private enum Constants {
        static let padding: CGFloat = 36.0
        static let verticalSmallSpacing: CGFloat = 30.0
        static let verticalBigSpacing: CGFloat = 100.0
        static let verticalMidSpacing: CGFloat = 60.0
    }

    // MARK: - UI
    
    private let pageTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = .pageTitle
        label.font = .title
        
        return label
    }()
    
    private lazy var loginField: RSTextField = {
        let field = RSTextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = .alphabet
        field.autocapitalizationType = .none
        
        field.placeholder = .loginFieldPlaceholder
        field.delegate = self
                
        return field
    }()
    
    private lazy var passwordField: RSTextField = {
        let field = RSTextField()
        
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        
        field.placeholder = .passwordFieldPlaceholder
        field.delegate = self
        
        return field
    }()

    private lazy var cypherView: CypherView = {
        let view = CypherView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.validationHandler = { [weak self] cases in
            if cases == self?.correctCypherCode {
                view.updateState(.success)
                self?.presentAlert()
            } else {
                view.updateState(.failure)
            }
        }
        
        view.isHidden = true
        
        return view
    }()
    
    private let authorizationButton: UIButton = {
        let button = RSButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.authorizationButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(authorizationButtonTap(_:)), for: .touchUpInside)
        
        return button
    }()
}

// MARK: - UIViewController overrides

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupAppearance()
        UIFont.fontNames(forFamilyName: "SF Mono")
    }
}

// MARK: - Private interface

private extension ViewController {
    
    @objc func authorizationButtonTap(_ sender: RSButton) {
        let isLoginCorrect: Bool = loginField.text == correctLogin
        let isPasswordCorrect: Bool = passwordField.text == correctPassword
        
        loginField.updateState(isLoginCorrect ? .success : .failure)
        passwordField.updateState(isPasswordCorrect ? .success : .failure)
        
        if isLoginCorrect, isPasswordCorrect {            
            UIView.animate(withDuration: 0.3) { [self] in
                loginField.updateState(.success)
                passwordField.updateState(.success)
                loginField.off()
                passwordField.off()
                authorizationButton.off()
                cypherView.isHidden = false
            }
        }
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Welcome!", message: "You are successfuly authorized!", preferredStyle: .alert)
        let refreshAction = UIAlertAction(title: "Refresh", style: .destructive, handler: refreshHandler(_:))
        alert.addAction(refreshAction)
        present(alert, animated: true)
    }
    
    func setupAppearance() {
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(pageTitleLabel)
        view.addSubview(authorizationButton)
        
        view.addSubview(cypherView)
        
        NSLayoutConstraint.activate([
            
            pageTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            
            loginField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.padding),
            loginField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.padding),
            loginField.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: Constants.verticalBigSpacing),

            passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: Constants.verticalSmallSpacing),
            passwordField.centerXAnchor.constraint(equalTo: loginField.centerXAnchor),
            
            authorizationButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            authorizationButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Constants.verticalMidSpacing),
            
            cypherView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cypherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding),
        ])
    }
    
    func refreshHandler(_ action: UIAlertAction) {
        cypherView.updateState(.default)
        loginField.updateState(.default)
        passwordField.updateState(.default)
        authorizationButton.on()
        loginField.on()
        passwordField.on()
        cypherView.isHidden = true
    }
}

// MARK: - UITextFieldDelegate {

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let textField = (textField as? RSTextField),
           textField.selectedState == .failure {
            textField.updateState(.default)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as? RSTextField)?.updateState(.default)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
