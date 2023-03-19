import UIKit

internal class CoffeeDetailCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeeDetailCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?, coffee: CoffeeDetail) -> UIViewController {
        let presenter = CoffeeDetailPresenter(coffee: coffee)
        let controller = CoffeeDetailViewController()
        
        presenter.view = controller
        
        controller.presenter = presenter
        
        return controller
    }
    
}
