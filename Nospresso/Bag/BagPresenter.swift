import UIKit

internal class BagPresenter: NSObject {
    
    // MARK: Module
    internal weak var view: BagViewController?
    internal let coordinator: BagCoordinator
    
    internal init(coordinator: BagCoordinator) {
        self.coordinator = coordinator
        super.init()
    }
    
}

// MARK: BagPresenterProtocol
extension BagPresenter: BagPresenterProtocol {
    
}
