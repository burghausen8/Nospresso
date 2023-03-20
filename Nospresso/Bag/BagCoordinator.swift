import UIKit

internal class BagCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension BagCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let presenter = BagsPresenter()
        let controller = BagsViewController()
        let repository = BagsRepository(output: presenter)
        
        presenter.repository = repository
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}
