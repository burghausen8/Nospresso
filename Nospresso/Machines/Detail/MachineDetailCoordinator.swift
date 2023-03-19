import UIKit

internal class MachineDetailCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension MachineDetailCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?, machine: Machine) -> UIViewController {
        let coordinator = MachineDetailCoordinator(navigationController: navigationController)
        let presenter = MachineDetailPresenter(machine: machine)
        let controller = MachineDetailViewController()
        
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}
