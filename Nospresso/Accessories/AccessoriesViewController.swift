import UIKit
import SnapKit
import Rswift

internal class AccessoriesViewController: UIViewController, LoadingViewType {
    
    var loadingScreen: LoadingViewController?
    
    // MARK: Module
    internal var presenter: AccessoriesPresenter? = nil
    
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

//MARK: AccessoriesViewControllerProtocol
extension AccessoriesViewController: AccessoriesViewControllerProtocol {
    
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
    
}

extension AccessoriesViewController: CodableView {
    
    internal func buildViews() {
        view.addSubview(separatorView)
        view.addSubview(tableView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = Strings.accessoriesTitle()
        self.view.backgroundColor = Colors.mainMenuCoffeeButton()
        
        //MARK: TableView Register
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(AccessoryTableViewCell.self, forCellReuseIdentifier: "AccessoryCell")
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
    }
}

