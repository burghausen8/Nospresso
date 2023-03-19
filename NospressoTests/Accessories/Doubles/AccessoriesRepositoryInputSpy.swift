@testable import Nospresso

class AccessoriesRepositoryInputSpy: AccessoriesRepositoryInputProtocol {

    var getAccessoriesCalled = false

    func getAccessories() {
        getAccessoriesCalled = true
    }

}
