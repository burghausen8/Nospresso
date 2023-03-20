import UIKit
import Rswift

internal class MachineCollectionViewCell: UICollectionViewCell {
    
    private var machine: Machine?
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 20)
        
        label.textColor = .black
        
        return label
    }()
    
    private lazy var imageVieww: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var priceAndHeartStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = Colors.greenShrek()
        
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    @objc private func heartButtonTapped() {
        if let machine = machine {
            let isFavorited = Favorites.instance.toggle(with: machine.mapToFavorite())
            alternate(for: isFavorited)
        }
        
    }
    
    // MARK: Setup
    internal func setup(for machine: Machine) {
        if Favorites.instance.checkIfOnTheList(favorite: machine.mapToFavorite()) {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
        }
        imageVieww.loadImage(from: machine.image)
        titleLabel.text = machine.name
        priceLabel.text = machine.unitValue.toMoney
        self.machine = machine
        
        setupViews()
    }
}

extension MachineCollectionViewCell: CodableView {
    
    internal func buildViews() {
        priceAndHeartStackView.addArrangedSubview(priceLabel)
        priceAndHeartStackView.addArrangedSubview(heartButton)
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(imageVieww)
        contentStackView.addArrangedSubview(priceAndHeartStackView)
        
        contentView.addSubview(contentStackView)
    }
    
    internal func configViews() {
        backgroundColor = .white
    }
    
    internal func configConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
        }
        imageVieww.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
        heartButton.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
    }
    
}

extension MachineCollectionViewCell: toggleInFavoritesDelegate {
    
    func alternate(for favoritaded: Bool) {
        DispatchQueue.main.async {
            let image = UIImage(systemName: (favoritaded ? "heart.fill" : "heart"))
            let color: UIColor = favoritaded ? .red : .gray
            
            self.heartButton.setImage(image, for: .normal)
            self.heartButton.tintColor = color
        }
    }
    
}
