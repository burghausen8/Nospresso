import UIKit

internal class AccessoriesCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension AccessoriesCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = AccessoriesCoordinator(navigationController: navigationController)
        let presenter = AccessoriesPresenter()
        let controller = AccessoriesViewController()
        let repository = AccessoriesRepository(output: presenter)
        
        presenter.coordinator = coordinator
        presenter.repository = repository
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}

extension AccessoriesCoordinator: AccessoriesCoordinatorProtocol {
    
    func openAccessoryDetail(with accessory: Item) {
        let viewController = AccessoryDetailCoordinator.createModule(navigationController: navigationController, accessory: accessory)
        
        navigationController?.present(viewController, animated: true)
    }
    
}
