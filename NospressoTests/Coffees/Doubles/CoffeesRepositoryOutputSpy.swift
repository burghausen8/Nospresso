@testable import Nospresso

class CoffeesRepositoryOutputSpy: CoffeesRepositoryOutputProtocol {

    var getCapsulesSucceededCalled = false
    var getCapsulesFailedCalled = false
    var getCoffeeDetailSucceededCalled = false
    var getCoffeeDetailFailedCalled = false
    
    func getCapsulesSucceeded(_ data: CapsulesResponse) {
        getCapsulesSucceededCalled = true
    }
    
    func getCapsulesFailed(_ errorMessage: String) {
        getCapsulesFailedCalled = true
    }
    
    func getCoffeeDetailSucceeded(_ coffeeDetail: CoffeeDetail) {
        getCoffeeDetailSucceededCalled = true
    }
    
    func getCoffeeDetailFailed(_ errorMessage: String) {
        getCoffeeDetailFailedCalled = true
    }

}
