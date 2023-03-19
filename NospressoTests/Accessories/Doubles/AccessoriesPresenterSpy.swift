@testable import Nospresso

class AccessoriesPresenterSpy: AccessoriesPresenterProtocol {
    
    var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}
