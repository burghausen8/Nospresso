import UIKit
import Rswift

protocol CoffeeTableViewCellDelegate: AnyObject {
    
    func bagButtonTapped()
    
}

internal class CoffeeTableViewCell: UITableViewCell {
    
    private var coffee: Coffee?
    private var delegate: CoffeeTableViewCellDelegate?
    
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
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var titleAndSubtitleStackView: UIStackView = {
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
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont(name: "OpenSans-LightItalic", size: 12)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-LightItalic", size: 9)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var priceView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = R.color.greenShrek()
        
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
        delegate?.bagButtonTapped()
    }
    
    @objc private func heartButtonTapped() {
        if let coffee = coffee {
            let isFavorited = Favorites.instance.toggle(with: coffee.mapToFavorite())
            alternate(for: isFavorited)
        }
        
    }
    
    // MARK: Setup
    internal func setup(for coffee: Coffee, delegate: CoffeeTableViewCellDelegate) {
        if Favorites.instance.checkIfOnTheList(favorite: coffee.mapToFavorite()) {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
        }
        imageVieww.loadImage(from: coffee.image)
        titleLabel.text = coffee.name
        subtitleLabel.text = coffee.description
        intensityLabel.text = R.string.localizable.coffeTableViewCellIntensity(String(coffee.intensity))
        priceLabel.text = coffee.unitValue.toMoney
        self.coffee = coffee
        self.delegate = delegate
        
        setupViews()
    }
    
}

extension CoffeeTableViewCell: CodableView {
    
    internal func buildViews() {
        titleAndSubtitleStackView.addArrangedSubview(titleLabel)
        titleAndSubtitleStackView.addArrangedSubview(subtitleLabel)
        
        textStackView.addArrangedSubview(titleAndSubtitleStackView)
        textStackView.addArrangedSubview(intensityLabel)
        
        iconsStackView.addArrangedSubview(heartButton)
        iconsStackView.addArrangedSubview(bagButton)
        
        priceView.addSubview(priceLabel)
        
        contentStackView.addArrangedSubview(imageVieww)
        contentStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(priceView)
        contentStackView.addArrangedSubview(iconsStackView)
        
        contentView.addSubview(contentStackView)
    }
    
    internal func configConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
        }
        titleAndSubtitleStackView.snp.makeConstraints { make in
            make.width.equalTo(230)
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

extension CoffeeTableViewCell: toggleInFavoritesDelegate {
    
    func alternate(for favoritaded: Bool) {
        DispatchQueue.main.async {
            let image = UIImage(systemName: (favoritaded ? "heart.fill" : "heart"))
            let color: UIColor = favoritaded ? .red : .gray
            
            self.heartButton.setImage(image, for: .normal)
            self.heartButton.tintColor = color
        }
    }
    
}
