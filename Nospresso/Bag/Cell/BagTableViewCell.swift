import UIKit
import Rswift

internal class BagTableViewCell: UITableViewCell {
    
    private var bag: Bag?
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .white
        
        return stackView
    }()
    
    private lazy var imageVieww: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 19)
        
        label.textColor = .black
        
        return label
    }()
    
    private lazy var typeItemLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 10)
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.greenShrek()
        
        return label
    }()
    
    // MARK: Setup
    internal func setup(for bag: Bag) {
        imageVieww.loadImage(from: bag.image)
        titleLabel.text = bag.name
        priceLabel.text = bag.unitValue.toMoney
        typeItemLabel.text = bag.type.rawValue
        self.bag = bag
        
        setupViews()
    }
}

extension BagTableViewCell: CodableView {
    
    internal func buildViews() {
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(typeItemLabel)
        
        contentStackView.addArrangedSubview(imageVieww)
        contentStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(priceLabel)
        
        contentView.addSubview(contentStackView)
    }
    
    func configViews() {
        contentView.backgroundColor = .white
    }
    
    internal func configConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
        textStackView.snp.makeConstraints { make in
            make.width.equalTo(230)
        }
        imageVieww.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }
    
}
