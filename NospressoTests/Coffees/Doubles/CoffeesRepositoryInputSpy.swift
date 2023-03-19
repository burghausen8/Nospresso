@testable import Nospresso

class CoffeesRepositoryInputSpy: CoffeesRepositoryInputProtocol {

    var getCapsulesCalled = false
    var getCoffeeDetailCalled = false

    func getCapsules() {
        getCapsulesCalled = true
    }
    
    func getCoffeeDetail(id: Int) {
        getCoffeeDetailCalled = true
    }

}
