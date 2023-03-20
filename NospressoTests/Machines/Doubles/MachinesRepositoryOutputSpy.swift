@testable import Nospresso

class MachinesRepositoryOutputSpy: MachinesRepositoryOutputProtocol {

    var getMachinesSucceededCalled = false
    var getMachinesFailedCalled = false
    
    func getMachinesSucceeded(_ data: [Machine]) {
        getMachinesSucceededCalled = true
    }
    
    func getMachinesFailed() {
        getMachinesFailedCalled = true
    }

}
