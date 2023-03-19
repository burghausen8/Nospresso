import UIKit

internal class MainMenuPresenter: NSObject {
    
    // MARK: Module
    internal weak var view: MainMenuViewController?
    internal var coordinator: MainMenuCoordinator?
    
    internal override init() {
        super.init()
    }
    
}

// MARK: MainMenuPresenterProtocol
extension MainMenuPresenter: MainMenuPresenterProtocol {
    
    func coffesButtonTapped() {
        coordinator?.openCoffees()
    }
    
    func machinesButtonTapped() {
        coordinator?.openMachines()
    }
    
    func accessoriesButtonTapped() {
        coordinator?.openAccessories()
    }
    
}
