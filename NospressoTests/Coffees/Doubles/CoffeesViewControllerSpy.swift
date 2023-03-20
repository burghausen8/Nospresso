@testable import Nospresso
import SwiftUI

class CoffeesViewControllerSpy: CoffeesViewControllerProtocol {

    var reloadDataCalled = false
    var showLoadCalled = false
    var hideLoadCalled = false
    var showAlertCalled = false
    var showErrorCalled = false
    var hideErrorCalled = false
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func showLoad() {
        showLoadCalled = true
    }
    
    func hideLoad() {
        hideLoadCalled = true
    }
    
    func showAlert(with alert: UIAlertController) {
        showAlertCalled = true
    }
    
    func showError() {
        showErrorCalled = true
    }
    
    func hideError() {
        hideLoadCalled = true
    }

}
