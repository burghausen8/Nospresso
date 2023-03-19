import UIKit
import SwiftUI

internal class CoffeesPresenter: NSObject {
    
    // MARK: Module
    internal var view: CoffeesViewControllerProtocol?
    internal var coordinator: CoffeesCoordinatorProtocol?
    internal var repository: CoffeesRepositoryInputProtocol?
    internal var capsules: [Capsules]?
    
    internal override init() {
        super.init()
    }
    
}

// MARK: CoffeesPresenterProtocol
extension CoffeesPresenter: CoffeesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoad()
        repository?.getCapsules()
    }
    
}

// MARK: TableViewDelegate
extension CoffeesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        if let capsules = capsules {
            repository?.getCoffeeDetail(id: capsules[indexPath.section].coffees[indexPath.row].id)
        }
        
    }
    
}

// MARK: TableViewDataSource
extension CoffeesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let capsules = capsules {
            return "  \(capsules[section].category)"
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
        
        return capsules?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capsules?[section].coffees.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath) as! CoffeeTableViewCell
        if let capsules = capsules {
            cell.setup(for: capsules[indexPath.section].coffees[indexPath.row], delegate: self)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: CoffesRepositoryOutputProtocol
extension CoffeesPresenter : CoffeesRepositoryOutputProtocol {
    
    func getCoffeeDetailSucceeded(_ coffeeDetail: CoffeeDetail) {
        coordinator?.openCoffeeDetail(with: coffeeDetail)
    }
    
    func getCoffeeDetailFailed(_ errorMessage: String) {
        print(errorMessage)
    }
    
    func getCapsulesSucceeded(_ data: CapsulesResponse) {
        view?.hideLoad()
        self.capsules = data.capsules
        view?.reloadData()
    }
    
    func getCapsulesFailed(_ errorMessage: String) {
        view?.hideLoad()
        print(errorMessage)
    }
    
}

extension CoffeesPresenter: CoffeeTableViewCellDelegate {
    
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
        
        //TODO: como não tem back, a sacola não funcionará
    }
    
}

