@testable import Nospresso

class CoffeesPresenterSpy: CoffeesPresenterProtocol {
    
    var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}
