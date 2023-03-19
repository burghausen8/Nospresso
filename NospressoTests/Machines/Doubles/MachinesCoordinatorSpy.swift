@testable import Nospresso

class MachinesCoordinatorSpy: MachinesCoordinatorProtocol {

    var openMachineDetailCalled = false

    func openMachineDetail(with machine: Machine) {
        openMachineDetailCalled = true
    }

}
