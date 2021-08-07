import UIKit

class RSTextField: UITextField {
    
    enum State {
        case failure
        case success
        case `default`
    }
    
    var selectedState: State = .default
    
    private enum Constants {
        static let borderWidth: CGFloat = 1.5
        static let cornerRadius: CGFloat = 5.0
    }

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        borderStyle = .roundedRect
        
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.blackCoral.cgColor
        layer.cornerRadius = Constants.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateState(_ state: State) {
        switch state {
        case .success:
            layer.borderColor = UIColor.turquoiseGreen.cgColor
            
        case .failure:
            layer.borderColor = UIColor.venetianRed.cgColor
        case .default:
            layer.borderColor = UIColor.blackCoral.cgColor
            text = nil
        }
        selectedState = state
    }
}
