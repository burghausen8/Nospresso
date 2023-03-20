import UIKit
import Rswift

protocol AccessoryTableViewCellDelegate: AnyObject {
    
    func bagButtonTapped(with bag: Bag)
    
}

internal class AccessoryTableViewCell: UITableViewCell {
    
    private var accessory: Item?
    private var delegate: AccessoryTableViewCellDelegate?
    
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
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 19)
        
        label.textColor = .black
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = Colors.greenShrek()
        
        return label
    }()
    
    private lazy var iconsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var bagButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "bag.badge.plus")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(bagButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func bagButtonTapped() {
        if let accessory = accessory {
            delegate?.bagButtonTapped(with: accessory.mapToBag())
        }
    }
    
    @objc private func heartButtonTapped() {
        if let accessory = accessory {
            let isFavorited = Favorites.instance.toggle(with: accessory.mapToFavorite())
            alternate(for: isFavorited)
        }
        
    }
    
    // MARK: Setup
    internal func setup(for accessory: Item, delegate: AccessoryTableViewCellDelegate) {
        if Favorites.instance.checkIfOnTheList(favorite: accessory.mapToFavorite()) {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
        }
        imageVieww.loadImage(from: accessory.image)
        titleLabel.text = accessory.name
        priceLabel.text = accessory.unitValue.toMoney
        self.accessory = accessory
        self.delegate = delegate
        
        setupViews()
    }
}

extension AccessoryTableViewCell: CodableView {
    
    internal func buildViews() {
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(priceLabel)
        
        iconsStackView.addArrangedSubview(heartButton)
        iconsStackView.addArrangedSubview(bagButton)
        
        
        contentStackView.addArrangedSubview(imageVieww)
        contentStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(iconsStackView)
        
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
            make.width.equalTo(280)
        }
        imageVieww.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.bottom.leading.equalToSuperview()
        }
        heartButton.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
        bagButton.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
    }
    
}

extension AccessoryTableViewCell: toggleInFavoritesDelegate {
    
    func alternate(for favoritaded: Bool) {
        DispatchQueue.main.async {
            let image = UIImage(systemName: (favoritaded ? "heart.fill" : "heart"))
            let color: UIColor = favoritaded ? .red : .gray
            
            self.heartButton.setImage(image, for: .normal)
            self.heartButton.tintColor = color
        }
    }
    
}
