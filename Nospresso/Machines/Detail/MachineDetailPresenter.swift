import UIKit
import SwiftUI

internal class MachineDetailPresenter: NSObject {
    
    // MARK: Module
    internal var view: MachineDetailViewControllerProtocol?
    internal var repository: MachineDetailRepositoryInputProtocol?
    internal let machine: Machine
    
    internal init(machine: Machine) {
        self.machine = machine
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

// MARK: MachineDetailPresenterProtocol
extension MachineDetailPresenter: MachineDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setup(for: machine)
    }
    
    func bagButtonTapped() {
        repository?.addToBag(with: machine.mapToBag())
    }
    
}

// MARK: MachineDetailRepositoryOutputProtocol
extension MachineDetailPresenter: MachineDetailRepositoryOutputProtocol {
    
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
