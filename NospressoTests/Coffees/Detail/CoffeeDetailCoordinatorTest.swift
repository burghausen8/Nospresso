@testable import Nospresso
import XCTest

class CoffeeDetailCoordinatorTestCase: XCTestCase {

    var sut: CoffeeDetailCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_createModule_returnsViewController() {
        // When
        let controller = CoffeeDetailCoordinator.createModule(navigationController: navigationControllerSpy, coffee: CoffeeDetailResponse.dummy().coffees[0])
        
        // Then
        XCTAssertTrue(controller is CoffeeDetailViewController)
    }
    
}
