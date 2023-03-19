import UIKit

internal class MachinesCoordinator {
    
    private weak var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension MachinesCoordinator {
    
    internal static func createModule(navigationController: UINavigationController?) -> UIViewController {
        let coordinator = MachinesCoordinator(navigationController: navigationController)
        let presenter = MachinesPresenter()
        let controller = MachinesViewController()
        let repository = MachinesRepository(output: presenter)
        
        presenter.coordinator = coordinator
        presenter.repository = repository
        presenter.view = controller
        controller.presenter = presenter
        
        return controller
    }
    
}

extension MachinesCoordinator: MachinesCoordinatorProtocol {
    
    func openMachineDetail(with machine: Machine) {
        let viewController = MachineDetailCoordinator.createModule(navigationController: navigationController, machine: machine)
        
        navigationController?.present(viewController, animated: true)
    }
    
}
