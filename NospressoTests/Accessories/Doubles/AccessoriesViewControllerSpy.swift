@testable import Nospresso
import SwiftUI

class AccessoriesViewControllerSpy: AccessoriesViewControllerProtocol {
    

    var reloadDataCalled = false
    var showLoadCalled = false
    var hideLoadCalled = false
    var showAllertCalled = false
    
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
        showAllertCalled = true
    }

}
