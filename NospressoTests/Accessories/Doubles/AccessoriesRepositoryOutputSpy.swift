@testable import Nospresso

class AccessoriesRepositoryOutputSpy: AccessoriesRepositoryOutputProtocol {

    var getAccessoriesSucceededCalled = false
    var getAccessoriesFailedCalled = false
    var addToBagSucceededCalled = false
    var  addToBagFailedCalled = false
    
    func getAccessoriesSucceeded(_ data: [Acessories]) {
        getAccessoriesSucceededCalled = true
    }
    
    func getAccessoriesFailed() {
        getAccessoriesFailedCalled = true
    }
    
    func addToBagSucceeded() {
        addToBagSucceededCalled = true
    }
    
    func addToBagFailed() {
        addToBagFailedCalled = true
    }

}
