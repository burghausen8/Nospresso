@testable import Nospresso

class CoffeeDetailPresenterSpy: CoffeeDetailPresenterProtocol {
    
    var viewDidLoadCalled = false
    var bagButtonCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func bagButtonTapped() {
        bagButtonCalled = true
    }

}
