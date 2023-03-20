@testable import Nospresso

class MachinesViewControllerSpy: MachinesViewControllerProtocol {

    var reloadDataCalled = false
    var showLoadCalled = false
    var hideLoadCalled = false
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
    
    func showError() {
        showErrorCalled = true
    }
    
    func hideError() {
        hideErrorCalled = true
    }

}
