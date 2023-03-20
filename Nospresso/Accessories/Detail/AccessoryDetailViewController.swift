import UIKit
import SnapKit
import Rswift

internal class AccessoryDetailViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: AccessoryDetailPresenter? = nil
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .white
        
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    private lazy var contentDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Bold, size: 26)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Light, size: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Light, size: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.greenShrek()
        button.setTitle(Strings.addToBag(), for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(bagButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func bagButtonTapped() {
        presenter?.bagButtonTapped()
    }
    
    // MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
        
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//MARK: AccessoryDetailViewControllerProtocol
extension AccessoryDetailViewController: AccessoryDetailViewControllerProtocol {
    
    internal func setup(for accessory: Item) {
        imageView.loadImage(from: accessory.image)
        priceLabel.text = accessory.unitValue.toMoney
        titleLabel.text = accessory.name
        descriptionLabel.text = accessory.description
        
        setupViews()
    }
    
    internal func showAlert(with alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
}

extension AccessoryDetailViewController: CodableView {
    
    internal func buildViews() {
        contentDescriptionStackView.addArrangedSubview(titleLabel)
        contentDescriptionStackView.addArrangedSubview(priceLabel)
        contentDescriptionStackView.addArrangedSubview(descriptionLabel)
        
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(contentDescriptionStackView)
        
        contentView.addSubview(contentStackView)
        contentView.addSubview(button)
        
        view.addSubview(contentView)
        
    }
    
    internal func configConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(240)
        }
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
    }
}
