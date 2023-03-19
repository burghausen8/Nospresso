@testable import Nospresso
import SwiftUI

class CoffeeDetailViewControllerSpy: CoffeeDetailViewControllerProtocol {    
    
    var setupCalled = false
    var showAlertCalled = false
    
    func setup(for coffee: CoffeeDetail) {
        setupCalled = true
    }
    
    func showAlert(with alert: UIAlertController) {
        showAlertCalled = true
    }

}
