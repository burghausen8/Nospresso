import UIKit
import SnapKit

internal class BagsViewController: UIViewController {
    
    // MARK: Module
    internal var presenter: BagsPresenter? = nil
    
    internal let contentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .white
        
        return view
    }()
    
    internal let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layoutMargins = .zero
        tableView.separatorInset = .zero
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    internal let nothingBagsLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.bagsNothing()
        label.textAlignment = .center
        label.textColor = .black
        
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
//MARK: BagsViewControllerProtocol
extension BagsViewController: BagsViewControllerProtocol {
    
    
    func hideLoad() {
        //TODO: fazer load
    }
    
    func showLoad() {
        //TODO: fazer load
    }
    
    internal func hiddenTableView() {
        tableView.isHidden = true
        nothingBagsLabel.isHidden = false
    }
    
    internal func showTableView() {
        tableView.isHidden = false
        nothingBagsLabel.isHidden = true
    }
    
    internal func reloadData() {
        tableView.reloadData()
    }
    
    internal func removeRow(at indexPath: [IndexPath], with local: UITableView.RowAnimation) {
        tableView.deleteRows(at: indexPath, with: local)
    }
    
}

extension BagsViewController: CodableView {
    
    internal func buildViews() {
        
        contentStackView.addArrangedSubview(tableView)
        contentStackView.addSubview(nothingBagsLabel)
        view.addSubview(contentStackView)
    }
    
    internal func configViews() {
        navigationController?.navigationBar.isHidden = true
        
        //MARK: TableView Register
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(BagTableViewCell.self, forCellReuseIdentifier: "BagCell")
    }
    
    internal func configConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nothingBagsLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

