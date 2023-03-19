import UIKit
import SwiftUI

internal class CoffeeDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: CoffeeDetailViewControllerProtocol?
    internal let coffee: CoffeeDetail
    
    internal init(coffee: CoffeeDetail) {
        self.coffee = coffee
        super.init()
    }
    
}

// MARK: CoffeeDetailPresenterProtocol
extension CoffeeDetailPresenter: CoffeeDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: coffee)
    }
    
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
        
        //TODO: como não tem back, a sacola não funcionará, apenas aparecerá um alert
    }
    
}
