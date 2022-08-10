import UIKit

class RSButton: UIButton {
    
    private enum Constants {
        static let borderWidth: CGFloat = 2.0
        static let cornerRadius: CGFloat = 10.0
        static let verticalEdgeInset: CGFloat = 10.0
        static let horizontalEdgeInset: CGFloat = 20.0
        static let fontSize: CGFloat = 20.0
        
        static let titleOpacity: CGFloat = 0.4
        static let backgroundOpacity: CGFloat = 0.2
        
        static let imageLeftInset: CGFloat = -5
    }
    
    private var isActive: Bool = false
    
    init() {
        super.init(frame: .zero)
        
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize, weight: .semibold)
        setTitleColor(.littleBoyBlue, for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: Constants.verticalEdgeInset, left: Constants.horizontalEdgeInset, bottom: Constants.verticalEdgeInset, right: Constants.horizontalEdgeInset)
        
        layer.borderWidth = Constants.borderWidth
        
        layer.borderColor = UIColor.littleBoyBlue.cgColor
        layer.cornerRadius = Constants.cornerRadius
        
        setTitleColor(UIColor.littleBoyBlue.withAlphaComponent(Constants.titleOpacity), for: .highlighted)
        setImage(UIImage(systemName: "person"), for: .normal)
        setImage(UIImage(systemName: "person.fill"), for: .highlighted)
        
        imageEdgeInsets.left = Constants.imageLeftInset
        
        tintColor = .littleBoyBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        willSet {
            layer.backgroundColor = !isHighlighted ? UIColor.littleBoyBlue.withAlphaComponent(Constants.backgroundOpacity).cgColor : UIColor.clear.cgColor
        }
    }
}

// MARK: - UIButton overrides

extension RSButton {
    
}
