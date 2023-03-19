import UIKit
import SwiftUI

internal class AccessoryDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: AccessoryDetailViewControllerProtocol?
    internal let accessory: Item
    
    internal init(accessory: Item) {
        self.accessory = accessory
        super.init()
    }
    
}

// MARK: AccessoryDetailPresenterProtocol
extension AccessoryDetailPresenter: AccessoryDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: accessory)
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
        
        //TODO: como não tem back, a sacola não funcionará, apenas emitirá um alert na tela
    }
    
}
