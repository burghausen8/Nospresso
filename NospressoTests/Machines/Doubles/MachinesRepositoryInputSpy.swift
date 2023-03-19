@testable import Nospresso

class MachinesRepositoryInputSpy: MachinesRepositoryInputProtocol {

    var getMachinesCalled = false

    func getMachines() {
        getMachinesCalled = true
    }

}
