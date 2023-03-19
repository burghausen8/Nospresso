import UIKit
import SnapKit

internal class FavoritesViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: FavoritesPresenter? = nil
    
    internal let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    internal let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins = .zero
        tableView.separatorInset = .zero
        
        return tableView
    }()
    
    internal let nothingFavoritedLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.favoritesNothing()
        label.textAlignment = .center
        
        return label
    }()
    
    //MARK: override methods
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.moduleLoaded()
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidAppear()
        super.viewDidAppear(false)
    }
    
    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
//MARK: FavoritesViewControllerProtocol
extension FavoritesViewController: FavoritesViewControllerProtocol {
    
    internal func hiddenTableView() {
        tableView.isHidden = true
        nothingFavoritedLabel.isHidden = false
    }
    
    internal func showTableView() {
        tableView.isHidden = false
        nothingFavoritedLabel.isHidden = true
    }
    
    internal func reloadData() {
        tableView.reloadData()
    }
    
    internal func removeRow(at indexPath: [IndexPath], with local: UITableView.RowAnimation) {
        tableView.deleteRows(at: indexPath, with: local)
    }
    
}

extension FavoritesViewController: CodableView {
    
    internal func buildViews() {
        
        contentView.addSubview(tableView)
        contentView.addSubview(nothingFavoritedLabel)
        view.addSubview(contentView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.isHidden = true
        
        //MARK: TableView Register
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "FavoriteCell")
    }
    
    internal func configConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nothingFavoritedLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

