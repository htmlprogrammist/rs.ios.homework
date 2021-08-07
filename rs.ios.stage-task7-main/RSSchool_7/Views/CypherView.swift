import UIKit

class CypherView: UIView {
    
    enum State {
        case failure
        case success
        case `default`
    }
    
    private enum Constants {
        static let underscore: String = "_"
        
        static let stackSpacing: CGFloat = 20.0
        static let stackPadding: CGFloat = 20.0
        
        static let borderWidth: CGFloat = 2.0
        static let cornerRadius: CGFloat = 8.0
        
        static let labelFontSize: CGFloat = 18.0
    }
    
    private var selectedCases: [CypherCases] = []
    
    private let cypherLabel: UILabel = {
        let view = UILabel()
        
        view.font = .systemFont(ofSize: Constants.labelFontSize, weight: .semibold)
        
        view.text = Constants.underscore
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Constants.stackSpacing
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var validationHandler: (([CypherCases]) -> ())?
    
    init() {
        super.init(frame: .zero)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public interface

extension CypherView {
    func updateState(_ state: State) {
        switch state {
        case .failure:
            layer.borderColor = UIColor.red.cgColor
            selectedCases.removeAll()
            cypherLabel.text = Constants.underscore
        case .success:
            layer.borderColor = UIColor.turquoiseGreen.cgColor
        case .default:
            layer.borderColor = UIColor.clear.cgColor
            selectedCases.removeAll()
            cypherLabel.text = Constants.underscore
        }
    }
}

// MARK: - Private interface

private extension CypherView {
    func buildButton(_ cypher: CypherCases) -> CypherButton {
        let view = CypherButton(cypher: cypher)
        view.addTarget(self, action: #selector(cypherButtonHandler(_:)), for: .touchUpInside)
        return view
    }
    
    func setupAppearance() {
        
        addSubview(cypherLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(buildButton(.one))
        stackView.addArrangedSubview(buildButton(.two))
        stackView.addArrangedSubview(buildButton(.three))
        
        NSLayoutConstraint.activate([
            cypherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15.0),
            cypherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23.0),
            stackView.topAnchor.constraint(equalTo: cypherLabel.bottomAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23.0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0)
        ])
        
        setupBorder()
    }
    
    func setupBorder() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = Constants.borderWidth
        layer.cornerRadius = Constants.cornerRadius
    }
    
    @objc func cypherButtonHandler(_ sender: CypherButton) {
        guard selectedCases.count < 3 else {
            validationHandler?(selectedCases)
            return
        }
        layer.borderColor = UIColor.clear.cgColor
        selectedCases.append(sender.cypher)
        updateLabel()
        if selectedCases.count == 3 {
            validationHandler?(selectedCases)
        }
    }
    
    func updateLabel() {
        cypherLabel.text = selectedCases.map { "\($0.rawValue)" }.joined(separator: " ")
        cypherLabel.layoutIfNeeded()
    }
}
