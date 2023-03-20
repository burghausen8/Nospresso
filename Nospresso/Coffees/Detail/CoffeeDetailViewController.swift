import UIKit
import SnapKit
import Rswift

internal class CoffeeDetailViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: CoffeeDetailPresenter? = nil
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
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
        imageView.image = Images.loader()
        
        return imageView
    }()
    
    private lazy var contentPriceView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Light, size: 11)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var capsulesLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Light, size: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Light, size: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var contentDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .SemiBoldItalic, size: 22)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var contentOriginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var originLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .black
        label.text = Strings.coffeeDetailOrigin()
        
        return label
    }()
    
    private lazy var originDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var contentRoastingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var roastingLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .black
        label.text = Strings.coffeeDetailRoasting()
        
        return label
    }()
    
    private lazy var roastingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var contentPerfilStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var perfilLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .black
        label.text = Strings.coffeeDetailPerfil()
        
        return label
    }()
    
    private lazy var perfilDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.get(type: .Regular, size: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        
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

//MARK: CoffeeDetailViewControllerProtocol
extension CoffeeDetailViewController: CoffeeDetailViewControllerProtocol {
    
    internal func setup(for coffee: CoffeeDetail) {
        
        imageView.loadImage(from: coffee.image)
        intensityLabel.text = Strings.coffeTableViewCellIntensity(String(coffee.intensity))
        capsulesLabel.text = Strings.coffeeDetailCapsules(String(10))
        priceLabel.text = coffee.unitValue.toMoney
        titleLabel.text = coffee.description
        originDescriptionLabel.text = coffee.origin
        roastingDescriptionLabel.text = coffee.roasting
        perfilDescriptionLabel.text = coffee.perfil
        navigationItem.title = coffee.name
        
        setupViews()
    }
    
    internal func showAlert(with alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
}

extension CoffeeDetailViewController: CodableView {
    
    internal func buildViews() {
        contentPriceView.addSubview(intensityLabel)
        contentPriceView.addSubview(capsulesLabel)
        contentPriceView.addSubview(priceLabel)
        
        contentOriginStackView.addArrangedSubview(originLabel)
        contentOriginStackView.addArrangedSubview(originDescriptionLabel)
        
        contentRoastingStackView.addArrangedSubview(roastingLabel)
        contentRoastingStackView.addArrangedSubview(roastingDescriptionLabel)
        
        contentPerfilStackView.addArrangedSubview(perfilLabel)
        contentPerfilStackView.addArrangedSubview(perfilDescriptionLabel)
        
        contentDescriptionStackView.addArrangedSubview(titleLabel)
        contentDescriptionStackView.addArrangedSubview(contentOriginStackView)
        contentDescriptionStackView.addArrangedSubview(contentRoastingStackView)
        contentDescriptionStackView.addArrangedSubview(contentPerfilStackView)
        
        contentStackView.addArrangedSubview(imageView)
        contentStackView.addArrangedSubview(contentPriceView)
        contentStackView.addArrangedSubview(contentDescriptionStackView)
        
        contentView.addSubview(contentScrollView)
        contentView.addSubview(button)
        
        contentScrollView.addSubview(contentStackView)
        
        view.addSubview(separatorView)
        view.addSubview(contentView)
        view.addSubview(contentScrollView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = Colors.mainMenuCoffeeButton()
        
    }
    
    internal func configConstraints() {
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(contentStackView.snp.top)
            make.height.equalTo(1)
        }
        contentView.snp.makeConstraints { make in
            make.trailing.bottom.leading.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        contentScrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(button.snp.top)
        }
        contentStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo((view.bounds.width)-40)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        intensityLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
        }
        capsulesLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalTo(priceLabel.snp.leading).offset(-5)
        }
        priceLabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(3)
        }
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(47)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
    }
    
}
