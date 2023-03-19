import SwiftUI

// View -> Presenter
internal protocol CoffeesPresenterProtocol {
    
    func viewDidLoad()
    
}

// Presenter -> Coordinator
internal protocol CoffeesCoordinatorProtocol {
    
    func openCoffeeDetail(with coffee: CoffeeDetail)
    
}

// Presenter -> Repository
internal protocol CoffeesRepositoryInputProtocol {
    
    func getCoffeeDetail(id: Int)
    func getCapsules()
    
}

// Repository -> Presenter
internal protocol CoffeesRepositoryOutputProtocol: AnyObject {
    
    func getCoffeeDetailSucceeded(_ coffeeDetail: CoffeeDetail)
    func getCoffeeDetailFailed(_ errorMessage: String)
    
    func getCapsulesSucceeded(_ data: CapsulesResponse)
    func getCapsulesFailed(_ errorMessage: String)
    
}

// Presenter -> View
internal protocol CoffeesViewControllerProtocol {
    
    func reloadData()
    func showLoad()
    func hideLoad()
    func showAlert(with alert: UIAlertController)
    
}
