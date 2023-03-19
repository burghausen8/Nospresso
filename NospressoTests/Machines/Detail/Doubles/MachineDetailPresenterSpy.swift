@testable import Nospresso

class MachineDetailPresenterSpy: MachineDetailPresenterProtocol {
    
    var viewDidLoadCalled = false
    var bagButtonCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func bagButtonTapped() {
        bagButtonCalled = true
    }

}
