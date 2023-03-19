import UIKit

internal class FavoritesCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension FavoritesCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = FavoritesCoordinator(navigationController: navigationController)
        let presenter = FavoritesPresenter()
        let controller = FavoritesViewController()
        
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}
