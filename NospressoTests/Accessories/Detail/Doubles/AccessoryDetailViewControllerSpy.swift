@testable import Nospresso
import SwiftUI

class AccessoryDetailViewControllerSpy: AccessoryDetailViewControllerProtocol {
    
    var setupCalled = false
    var showAlertCalled = false
    
    func setup(for accessory: Item) {
        setupCalled = true
    }
    
    func showAlert(with alert: UIAlertController) {
        showAlertCalled = true
    }

}
