import SwiftUI

// View -> Presenter
internal protocol AccessoryDetailPresenterProtocol {
    
    func viewDidLoad()
    func bagButtonTapped()
    
}

// Presenter -> View
internal protocol AccessoryDetailViewControllerProtocol {
    
    func setup(for accessory: Item)
    func showAlert(with alert: UIAlertController)
    
}
