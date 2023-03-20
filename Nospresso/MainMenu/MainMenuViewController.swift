import UIKit
import SnapKit
import Rswift

internal class MainMenuViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: MainMenuPresenterProtocol? = nil
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    private lazy var coffeesButton: MenuItemButton = {
        let button = MenuItemButton()
        button.setup(title: Strings.coffee(),
                     subtitle: Strings.mainMenuCoffeeButtonSubtitle() ,
                     image: UIImage(named:"capsulas-inicio"),
                     backgroundCollor: Colors.mainMenuCoffeeButton()
        )
        return button
    }()
    
    private lazy var machinesButton: MenuItemButton = {
        let button = MenuItemButton()
        button.setup(title: Strings.mainMenuMachinesButtonTitle(),
                     subtitle: Strings.mainMenuMachinesButtonSubtitle(),
                     image: UIImage(named:"maquina-inicio"),
                     backgroundCollor: Colors.mainMenuMachinesButton()
        )
        
        return button
    }()
    
    private lazy var accessoriesButton: MenuItemButton = {
        let button = MenuItemButton()
        button.setup(title: Strings.mainMenuAccessoriesButtonTitle(),
                     subtitle: Strings.mainMenuAccessoriesButtonSubtitle(),
                     image: Images.xicarasInicio(),
                     backgroundCollor: Colors.mainMenuAccessoriesButton()
        )
        
        return button
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    private func setupTapGesture() {
        let tapGestureCoffeeButton = UITapGestureRecognizer(target: self, action: #selector(self.coffeeButtonTapped))
        let tapGestureMachinesButton = UITapGestureRecognizer(target: self, action: #selector(self.machinesButtonTapped))
        let tapGestureAccessoriesButton = UITapGestureRecognizer(target: self, action: #selector(self.accessoriesButtonTapped))
        
        coffeesButton.addGestureRecognizer(tapGestureCoffeeButton)
        machinesButton.addGestureRecognizer(tapGestureMachinesButton)
        accessoriesButton.addGestureRecognizer(tapGestureAccessoriesButton)
    }
    
    @objc private func coffeeButtonTapped() {
        presenter?.coffesButtonTapped()
    }
    
    @objc private func machinesButtonTapped() {
        presenter?.machinesButtonTapped()
    }
    
    @objc private func accessoriesButtonTapped() {
        presenter?.accessoriesButtonTapped()
    }
    
    //MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTapGesture()
        self.view.backgroundColor = .white
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension MainMenuViewController: CodableView {
    
    internal func buildViews() {
        containerStackView.addArrangedSubview(coffeesButton)
        containerStackView.addArrangedSubview(machinesButton)
        containerStackView.addArrangedSubview(accessoriesButton)
        view.addSubview(containerStackView)
        view.addSubview(separatorView)
    }
    
    internal func configConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(1)
        }
    }
    
}
