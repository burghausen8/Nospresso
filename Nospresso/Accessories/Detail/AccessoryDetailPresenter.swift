import UIKit
import SwiftUI

internal class AccessoryDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: AccessoryDetailViewControllerProtocol?
    internal var repository: AccessoryDetailRepositoryInputProtocol?
    internal let accessory: Item
    
    internal init(accessory: Item) {
        self.accessory = accessory
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

// MARK: AccessoryDetailPresenterProtocol
extension AccessoryDetailPresenter: AccessoryDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: accessory)
    }
    
    func bagButtonTapped() {
        repository?.addToBag(with: accessory.mapToBag())
    }
    
}

//MARK AccessoryDetailRepositoryOutputProtocol
extension AccessoryDetailPresenter: AccessoryDetailRepositoryOutputProtocol {
    
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
