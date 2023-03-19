@testable import Nospresso

class MachinesViewControllerSpy: MachinesViewControllerProtocol {

    var reloadDataCalled = false
    var showLoadCalled = false
    var hideLoadCalled = false
    
    func reloadData() {
        reloadDataCalled = true
    }
    
    func showLoad() {
        showLoadCalled = true
    }
    
    func hideLoad() {
        hideLoadCalled = true
    }

}
