@testable import Nospresso

class CoffeesRepositoryOutputSpy: CoffeesRepositoryOutputProtocol {

    var getCapsulesSucceededCalled = false
    var getCapsulesFailedCalled = false
    var getCoffeeDetailSucceededCalled = false
    var getCoffeeDetailFailedCalled = false
    var addToBagSucceededCalled = false
    var addToBagFailedCalled = false
    
    func getCapsulesSucceeded(_ data: [Capsules]) {
        getCapsulesSucceededCalled = true
    }
    
    func getCapsulesFailed() {
        getCapsulesFailedCalled = true
    }
    
    func getCoffeeDetailSucceeded(_ coffeeDetail: CoffeeDetail) {
        getCoffeeDetailSucceededCalled = true
    }
    
    func getCoffeeDetailFailed() {
        getCoffeeDetailFailedCalled = true
    }
    
    func addToBagSucceeded() {
        addToBagSucceededCalled = true
    }
    
    func addToBagFailed() {
        addToBagFailedCalled = true
    }

}
