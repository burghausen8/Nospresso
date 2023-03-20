@testable import Nospresso

class CoffeesRepositoryInputSpy: CoffeesRepositoryInputProtocol {

    var getCapsulesCalled = false
    var getCoffeeDetailCalled = false
    var addToBagCalled = false

    func getCapsules() {
        getCapsulesCalled = true
    }
    
    func getCoffeeDetail(id: Int) {
        getCoffeeDetailCalled = true
    }
    
    func addToBag(with bag: Bag) {
        addToBagCalled = true
    }

}
