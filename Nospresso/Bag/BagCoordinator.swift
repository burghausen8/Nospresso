import UIKit

internal class BagCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension BagCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = BagCoordinator(navigationController: navigationController)
        let presenter = BagPresenter(coordinator: coordinator)
        let controller = BagViewController()
        
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}

extension BagCoordinator: BagCoordinatorProtocol {
   
    func openClients() {
//        let controler = MenuClientsCoordinator.createModule(navigationController: navigationController)
//
//        navigationController?.pushViewController(controler, animated: true)
    }
    
    
}
