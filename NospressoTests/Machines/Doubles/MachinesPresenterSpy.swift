@testable import Nospresso

class MachinesPresenterSpy: MachinesPresenterProtocol {
    
    var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}
