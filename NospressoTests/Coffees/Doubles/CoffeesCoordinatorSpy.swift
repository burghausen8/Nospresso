@testable import Nospresso

class CoffeesCoordinatorSpy: CoffeesCoordinatorProtocol {

    var openCoffeeDetailCalled = false

    func openCoffeeDetail(with coffee: CoffeeDetail) {
        openCoffeeDetailCalled = true
    }

}
