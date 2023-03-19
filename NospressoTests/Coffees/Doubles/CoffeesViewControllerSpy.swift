@testable import Nospresso
import SwiftUI

class CoffeesViewControllerSpy: CoffeesViewControllerProtocol {
 
    var reloadDataCalled = false
    var showLoadCalled = false
    var hideLoadCalled = false
    var showAlertCalled = false
    
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

}
