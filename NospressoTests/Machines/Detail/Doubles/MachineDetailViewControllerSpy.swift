@testable import Nospresso
import SwiftUI

class MachineDetailViewControllerSpy: MachineDetailViewControllerProtocol {
    
    var setupCalled = false
    var showAlertCalled = false
    
    func setup(for machine: Machine) {
        setupCalled = true
    }
    
    func showAlert(with alert: UIAlertController) {
        showAlertCalled = true
    }

}
