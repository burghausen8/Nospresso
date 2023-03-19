import UIKit
import SwiftUI

internal class AccessoriesPresenter: NSObject {
    
    // MARK: Module
    internal var view: AccessoriesViewControllerProtocol?
    internal var coordinator: AccessoriesCoordinatorProtocol?
    internal var repository: AccessoriesRepositoryInputProtocol?
    internal var accessories: [Acessories]?
    
    internal override init() {
        super.init()
    }
    
}

// MARK: AccessoriesPresenterProtocol
extension AccessoriesPresenter: AccessoriesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoad()
        repository?.getAccessories()
    }
    
}

// MARK: TableViewDelegate
extension AccessoriesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        if let accessories = accessories {
            coordinator?.openAccessoryDetail(with: accessories[indexPath.section].items[indexPath.row])
        }
        
    }
    
}

// MARK: TableViewDataSource
extension AccessoriesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let accessories = accessories {
            return "  \(accessories[section].category)"
        }
        return nil
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = R.color.headerTableView()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont(name: "OpenSans-Italic", size: 21)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return accessories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessories?[section].items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccessoryCell", for: indexPath) as! AccessoryTableViewCell
        if let accessories = accessories {
            cell.setup(for: accessories[indexPath.section].items[indexPath.row], delegate: self)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: AccessoriesRepositoryOutputProtocol
extension AccessoriesPresenter : AccessoriesRepositoryOutputProtocol {
    
    func getAccessoriesSucceeded(_ data: AccessoriesResponse) {
        view?.hideLoad()
        self.accessories = data.accessories
        view?.reloadData()
    }
    
    func getAccessoriesFailed(_ errorMessage: String) {
        view?.hideLoad()
        print(errorMessage)
    }
    
}

extension AccessoriesPresenter: AccessoryTableViewCellDelegate {
    
    func bagButtonTapped() {
        let alert = UIAlertController(title: R.string.localizable.oba(),
                                      message: R.string.localizable.alertViewMessage(),
                                      preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: R.string.localizable.continue(),
                                      style: UIAlertAction.Style.default,
                                      handler: nil
                                     )
        )
        view?.showAlert(with: alert)
        
        //TODO: como não tem back, a sacola não funcionará, apenas aparecerá um alert na tela
    }
    
}

