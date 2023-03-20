@testable import Nospresso

class AccessoriesRepositoryInputSpy: AccessoriesRepositoryInputProtocol {

    var getAccessoriesCalled = false
    var addToBagCalled = false

    func getAccessories() {
        getAccessoriesCalled = true
    }
    
    func addToBag(with bag : Bag) {
        addToBagCalled = true
    }

}
