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

// MARK: CoffeesPresenterProtocol
extension CoffeesPresenter: CoffeesPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoad()
        repository?.getCapsules()
    }
    
    func tryAgainButtonTapped() {
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
        view.tintColor = Colors.headerTableView()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = Fonts.get(type: .Italic, size: 21)
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
        DispatchQueue.main.async {
            self.view?.hideLoad()
            self.view?.hideError()
            self.coordinator?.openCoffeeDetail(with: coffeeDetail)
        }
    }
    
    func getCoffeeDetailFailed() {
        view?.hideLoad()
        view?.showError()
    }
    
    func getCapsulesSucceeded(_ data: [Capsules]) {
        self.capsules = data
        DispatchQueue.main.async {
            self.view?.hideLoad()
            self.view?.hideError()
            self.view?.reloadData()
        }
    }
    
    func getCapsulesFailed() {
        view?.hideLoad()
        view?.showError()
    }
    
    func addToBagSucceeded() {
        DispatchQueue.main.async {
            self.view?.hideLoad()
            let alert = self.createAlertView(title: Strings.oba(), message: Strings.alertViewMessage())
            self.view?.showAlert(with: alert)
        }
    }
    
    func addToBagFailed() {
        view?.hideLoad()
        let alert = createAlertView(title: Strings.alertViewMessageTitleError(), message: Strings.alertViewMessageError())
        view?.showAlert(with: alert)
    }
    
}

extension CoffeesPresenter: CoffeeTableViewCellDelegate {
    
    func bagButtonTapped(with bag: Bag) {
        repository?.addToBag(with: bag)
    }
    
}

