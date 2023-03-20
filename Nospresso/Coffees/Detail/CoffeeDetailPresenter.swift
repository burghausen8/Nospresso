import UIKit
import SwiftUI

internal class CoffeeDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: CoffeeDetailViewControllerProtocol?
    internal var repository: CoffeeDetailRepositoryInputProtocol?
    internal let coffee: CoffeeDetail
    
    internal init(coffee: CoffeeDetail) {
        self.coffee = coffee
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

// MARK: CoffeeDetailPresenterProtocol
extension CoffeeDetailPresenter: CoffeeDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: coffee)
    }
    
    func bagButtonTapped() {
        repository?.addToBag(with: coffee.mapToBag())
    }
    
}

// MARK: CoffeDetailRepositoryOutputProtocol
extension CoffeeDetailPresenter: CoffeeDetailRepositoryOutputProtocol {
    
    func addToBagSucceeded() {
        DispatchQueue.main.async {
            let alert = self.createAlertView(title: Strings.oba(), message: Strings.alertViewMessage())
            self.view?.showAlert(with: alert)
        }
    }
    
    func addToBagFailed() {
        DispatchQueue.main.async {
            let alert = self.createAlertView(title: Strings.alertViewMessageTitleError(), message: Strings.alertViewMessageError())
            self.view?.showAlert(with: alert)
        }
    }
    
}
