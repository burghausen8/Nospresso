import UIKit
import SnapKit
import Rswift

internal class MachineDetailViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: MachineDetailPresenter? = nil
    
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
        label.font = UIFont(name: "OpenSans-Bold", size: 26)
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Light", size: 24)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Light", size: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = R.color.greenShrek()
        button.setTitle(R.string.localizable.addToBag(), for: .normal)
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

//MARK: MachinesDetailViewControllerProtocol
extension MachineDetailViewController: MachineDetailViewControllerProtocol {
   
    internal func setup(for machine: Machine) {
            imageView.loadImage(from: machine.image)
            priceLabel.text = machine.unitValue.toMoney
            titleLabel.text = machine.name
            descriptionLabel.text = machine.description
            
            setupViews()
    }
    
    internal func showAlert(with alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
}

extension MachineDetailViewController: CodableView {
    
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
    
    internal func configViews() {
        
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
