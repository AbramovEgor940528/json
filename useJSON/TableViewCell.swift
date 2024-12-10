import UIKit

class TableViewCell: UITableViewCell {

    private struct Constraints {
        struct RoundBackgroundView {
            static let horizontalSpacing: CGFloat = 20
            static let verticalSpacing: CGFloat = 10
        }
        
        struct AuthorLabel {
            static let verticalSpacing: CGFloat = 8
        }
        
        struct QuoteLabel {
            static let verticalSpacing: CGFloat = 8
        }
    }
    
    private var roundBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    func configCell(authorName: String, quoteName: String) {
        authorLabel.text = authorName
        quoteLabel.text = quoteName
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        addSubview(roundBackgroundView)
        addSubview(authorLabel)
        addSubview(quoteLabel)
        
        roundBackgroundView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: Constraints.RoundBackgroundView.horizontalSpacing
        ).isActive = true
        roundBackgroundView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: -Constraints.RoundBackgroundView.horizontalSpacing
        ).isActive = true
        roundBackgroundView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: Constraints.RoundBackgroundView.verticalSpacing
        ).isActive = true
        roundBackgroundView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -Constraints.RoundBackgroundView.verticalSpacing
        ).isActive = true
        
        quoteLabel.bottomAnchor.constraint(
            equalTo: roundBackgroundView.bottomAnchor,
            constant: -Constraints.QuoteLabel.verticalSpacing
        ).isActive = true
        quoteLabel.centerXAnchor.constraint(
            equalTo: roundBackgroundView.centerXAnchor
        ).isActive = true
    
        authorLabel.topAnchor.constraint(
            equalTo: roundBackgroundView.topAnchor,
            constant: Constraints.AuthorLabel.verticalSpacing
        ).isActive = true
        authorLabel.centerXAnchor.constraint(
            equalTo: roundBackgroundView.centerXAnchor
        ).isActive = true
    }
}


