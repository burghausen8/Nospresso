@testable import Nospresso

class AccessoriesCoordinatorSpy: AccessoriesCoordinatorProtocol {

    var openAccessoryDetailCalled = false

    func openAccessoryDetail(with accessory: Item) {
        openAccessoryDetailCalled = true
    }

}
