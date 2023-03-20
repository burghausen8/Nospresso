@testable import Nospresso

class CoffeesPresenterSpy: CoffeesPresenterProtocol {
    
    var viewDidLoadCalled = false
    var tryAgainButtonTappedCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func tryAgainButtonTapped() {
        tryAgainButtonTappedCalled = true
    }

}
