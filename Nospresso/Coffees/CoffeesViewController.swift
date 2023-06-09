import UIKit
import SnapKit
import Rswift

internal class CoffeesViewController: UIViewController, LoadingViewType {
    
    var loadingScreen: LoadingViewController?
    
    // MARK: Module
    internal var presenter: CoffeesPresenter? = nil
    
    private lazy var errorView: ErrorView = {
        let errorView = ErrorView()
        errorView.delegate = self
        
        return errorView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    internal let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins = .zero
        tableView.separatorInset = .zero
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    //MARK: Override Methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
        self.view.backgroundColor = Colors.mainMenuCoffeeButton()
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//MARK: CoffeesViewControllerProtocol
extension CoffeesViewController: CoffeesViewControllerProtocol {
    
    internal func reloadData() {
        tableView.reloadData()
    }
    
    internal func showLoad() {
        showLoading()
    }
    
    internal func hideLoad() {
        hideLoading()
    }
    
    internal func showAlert(with alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        errorView.isHidden = false
    }
    
    func hideError() {
        errorView.isHidden = true
    }
    
}

//MARK: ErrorViewDelegateProtocol
extension CoffeesViewController: ErrorViewDelegateProtocol {
    
    func tryAgainButtonTapped() {
        presenter?.tryAgainButtonTapped()
    }
    
}

extension CoffeesViewController: CodableView {
    
    internal func buildViews() {
        view.addSubview(separatorView)
        view.addSubview(tableView)
        view.addSubview(errorView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = Strings.coffee()
        
        //MARK: TableView Register
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(CoffeeTableViewCell.self, forCellReuseIdentifier: "CoffeeCell")
    }
    
    internal func configConstraints() {
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(tableView.snp.top)
            make.height.equalTo(1)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
