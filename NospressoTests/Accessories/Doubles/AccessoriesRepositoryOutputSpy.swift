@testable import Nospresso

class AccessoriesRepositoryOutputSpy: AccessoriesRepositoryOutputProtocol {

    var getAccessoriesSucceededCalled = false
    var getAccessoriesFailedCalled = false
    
    func getAccessoriesSucceeded(_ data: AccessoriesResponse) {
        getAccessoriesSucceededCalled = true
    }
    
    func getAccessoriesFailed(_ errorMessage: String) {
        getAccessoriesFailedCalled = true
    }

}
