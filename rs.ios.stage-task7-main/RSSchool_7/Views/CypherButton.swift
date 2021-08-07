import UIKit

class CypherButton: UIButton {
    
    private enum Constants {
        static let backgroundOpacity: CGFloat = 0.2
    }

    let cypher: CypherCases
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 50.0, height: 50.0)
    }
    
    init(cypher: CypherCases) {
        self.cypher = cypher
        super.init(frame: .zero)
        
        setTitle("\(cypher.rawValue)", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 30, weight: .medium)
        
        setTitleColor(.littleBoyBlue, for: .normal)
        
        layer.cornerRadius = 25.0
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.littleBoyBlue.cgColor
        
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
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
