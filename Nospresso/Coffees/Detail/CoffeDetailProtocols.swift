import SwiftUI

// View -> Presenter
internal protocol CoffeeDetailPresenterProtocol {
    
    func viewDidLoad()
    func bagButtonTapped()
    
}

// Presenter -> View
internal protocol CoffeeDetailViewControllerProtocol {
    
    func setup(for coffee: CoffeeDetail)
    func showAlert(with alert: UIAlertController)
    
}

// Presenter -> Repository
internal protocol CoffeeDetailRepositoryInputProtocol {
    
    func addToBag(with bag : Bag)
    
}

// Repository -> Presenter
internal protocol CoffeeDetailRepositoryOutputProtocol: AnyObject {
    
    func addToBagSucceeded()
    func addToBagFailed()
    
}
