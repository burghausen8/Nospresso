import UIKit

internal class AccessoryDetailCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension AccessoryDetailCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?, accessory: Item) -> UIViewController {
        let coordinator = AccessoryDetailCoordinator(navigationController: navigationController)
        let presenter = AccessoryDetailPresenter(accessory: accessory)
        let controller = AccessoryDetailViewController()
        
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}
