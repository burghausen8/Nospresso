import UIKit
import SwiftUI

internal class MachineDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: MachineDetailViewControllerProtocol?
    internal let machine: Machine
    
    internal init(machine: Machine) {
        self.machine = machine
        super.init()
    }
    
}

// MARK: MachineDetailPresenterProtocol
extension MachineDetailPresenter: MachineDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: machine)
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
        
        //TODO: como não tem back, a sacola não funcionará, apenas emitira um alert na tela
    }
    
}
