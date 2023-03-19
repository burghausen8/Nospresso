import SwiftUI

// View -> Presenter
internal protocol MachineDetailPresenterProtocol {
    func viewDidLoad()
    func bagButtonTapped()
}

// Presenter -> View
internal protocol MachineDetailViewControllerProtocol {
    
    func setup(for machine: Machine)
    func showAlert(with alert: UIAlertController)
    
}
