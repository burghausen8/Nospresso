import UIKit
import Rswift

internal class FavoriteTableViewCell: UITableViewCell {
    
    private var favorite: Favorite?
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
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
        label.font =  UIFont(name: "OpenSans-Regular", size: 19)
        
        label.textColor = .black
        
        return label
    }()
    
    private lazy var typeItemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Regular", size: 10)
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = R.color.greenShrek()
        
        return label
    }()
    
    // MARK: Setup
    internal func setup(for favorite: Favorite) {
        imageVieww.loadImage(from: favorite.image)
        titleLabel.text = favorite.name
        priceLabel.text = favorite.unitValue.toMoney
        typeItemLabel.text = favorite.type.rawValue
        self.favorite = favorite
        
        setupViews()
    }
}

extension FavoriteTableViewCell: CodableView {
    
    internal func buildViews() {
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(typeItemLabel)
        
        contentStackView.addArrangedSubview(imageVieww)
        contentStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(priceLabel)
        
        contentView.addSubview(contentStackView)
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
