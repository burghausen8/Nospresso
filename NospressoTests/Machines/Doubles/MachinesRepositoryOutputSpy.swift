@testable import Nospresso

class MachinesRepositoryOutputSpy: MachinesRepositoryOutputProtocol {

    var getMachinesSucceededCalled = false
    var getMachinesFailedCalled = false
    
    func getMachinesSucceeded(_ data: MachinesResponse) {
        getMachinesSucceededCalled = true
    }
    
    func getMachinesFailed(_ errorMessage: String) {
        getMachinesFailedCalled = true
    }

}
