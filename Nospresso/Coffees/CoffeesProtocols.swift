import SwiftUI

// View -> Presenter
internal protocol CoffeesPresenterProtocol {
    
    func viewDidLoad()
    func tryAgainButtonTapped()
    
}

// Presenter -> Coordinator
internal protocol CoffeesCoordinatorProtocol {
    
    func openCoffeeDetail(with coffee: CoffeeDetail)
    
}

// Presenter -> Repository
internal protocol CoffeesRepositoryInputProtocol {
    
    func getCoffeeDetail(id: Int)
    func getCapsules()
    func addToBag(with bag : Bag)
    
}

// Repository -> Presenter
internal protocol CoffeesRepositoryOutputProtocol: AnyObject {
    
    func getCoffeeDetailSucceeded(_ coffeeDetail: CoffeeDetail)
    func getCoffeeDetailFailed()
    
    func getCapsulesSucceeded(_ data: [Capsules])
    func getCapsulesFailed()
    
    func addToBagSucceeded()
    func addToBagFailed()
    
}

// Presenter -> View
internal protocol CoffeesViewControllerProtocol {
    
    func reloadData()
    func showLoad()
    func hideLoad()
    func showAlert(with alert: UIAlertController)
    func showError()
    func hideError()
    
}
