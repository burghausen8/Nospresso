import SwiftUI

// View -> Presenter
internal protocol AccessoriesPresenterProtocol {
    
    func viewDidLoad()
    
}

// Presenter -> Coordinator
internal protocol AccessoriesCoordinatorProtocol {
    
    func openAccessoryDetail(with accessory: Item)
    
}

// Presenter -> Repository
internal protocol AccessoriesRepositoryInputProtocol {
    
    func getAccessories()
    func addToBag(with bag : Bag)
    
}

// Repository -> Presenter
internal protocol AccessoriesRepositoryOutputProtocol: AnyObject {
    
    func getAccessoriesSucceeded(_ data: [Acessories])
    func getAccessoriesFailed()
    
    func addToBagSucceeded()
    func addToBagFailed()
    
}

// Presenter -> View
internal protocol AccessoriesViewControllerProtocol {
    
    func reloadData()
    func showLoad()
    func hideLoad()
    func showAlert(with alert: UIAlertController)
    
}
