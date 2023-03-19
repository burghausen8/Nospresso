import UIKit

internal class MainMenuCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension MainMenuCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = MainMenuCoordinator(navigationController: navigationController)
        let presenter = MainMenuPresenter()
        let controller = MainMenuViewController()
        
        presenter.coordinator = coordinator
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}

extension MainMenuCoordinator: MainMenuCoordinatorProtocol {
    
    func openCoffees() {
        let viewController = CoffeesCoordinator.createModule(navigationController: navigationController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openMachines() {
        let viewController = MachinesCoordinator.createModule(navigationController: navigationController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openAccessories() {
        let viewController = AccessoriesCoordinator.createModule(navigationController: navigationController)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
