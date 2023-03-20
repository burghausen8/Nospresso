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
    
    private func createAlertView(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: Strings.continue(),
                                      style: UIAlertAction.Style.default,
                                      handler: nil
                                     )
        )
        
        return alert
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
        view.tintColor = Colors.headerTableView()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = Fonts.get(type: .Italic, size: 21)
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
    
    func getAccessoriesSucceeded(_ data: [Acessories]) {
        self.accessories = data
        DispatchQueue.main.async {
            self.view?.hideLoad()
            self.view?.reloadData()
        }
    }
    
    func getAccessoriesFailed() {
        view?.hideLoad()
    }
    
    func addToBagSucceeded() {
        DispatchQueue.main.async {
            self.view?.hideLoad()
            let alert = self.createAlertView(title: Strings.oba(), message: Strings.alertViewMessage())
            self.view?.showAlert(with: alert)
        }
    }
    
    func addToBagFailed() {
        DispatchQueue.main.async {
            self.view?.hideLoad()
            let alert = self.createAlertView(title: Strings.alertViewMessageTitleError(), message: Strings.alertViewMessageError())
            self.view?.showAlert(with: alert)
        }
    }
    
}

extension AccessoriesPresenter: AccessoryTableViewCellDelegate {

    func bagButtonTapped(with bag: Bag) {
        repository?.addToBag(with: bag)
    }
    
}

