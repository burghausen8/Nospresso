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
    
}

// Repository -> Presenter
internal protocol AccessoriesRepositoryOutputProtocol: AnyObject {
    
    func getAccessoriesSucceeded(_ data: AccessoriesResponse)
    func getAccessoriesFailed(_ errorMessage: String)
    
}

// Presenter -> View
internal protocol AccessoriesViewControllerProtocol {
    
    func reloadData()
    func showLoad()
    func hideLoad()
    func showAlert(with alert: UIAlertController)
    
}
