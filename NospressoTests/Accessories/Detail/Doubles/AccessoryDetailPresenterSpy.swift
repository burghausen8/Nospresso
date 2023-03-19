@testable import Nospresso

class AccessoryDetailPresenterSpy: AccessoryDetailPresenterProtocol {
    
    var viewDidLoadCalled = false
    var bagButtonCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func bagButtonTapped() {
        bagButtonCalled = true
    }

}
