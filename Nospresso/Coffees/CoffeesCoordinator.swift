import UIKit

internal class CoffeesCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeesCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = CoffeesCoordinator(navigationController: navigationController)
        let presenter = CoffeesPresenter()
        let controller = CoffeesViewController()
        let repository = CoffeesRepository(output: presenter)
        
        presenter.coordinator = coordinator
        presenter.repository = repository
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}

extension CoffeesCoordinator: CoffeesCoordinatorProtocol {
    
    func openCoffeeDetail(with coffee: CoffeeDetail) {
        let viewController = CoffeeDetailCoordinator.createModule(navigationController: navigationController, coffee: coffee)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
