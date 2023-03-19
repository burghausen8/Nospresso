@testable import Nospresso
import XCTest

class CoffeesCoordinatorTestCase: XCTestCase {

    var sut: CoffeesCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_openCoffeeDetail_shouldPushViewController() throws {
        //When
        sut.openCoffeeDetail(with: CoffeeDetailResponse.dummy().coffees[0])
        
        //Then
        XCTAssertTrue(navigationControllerSpy.isPushViewControllerCalled)
    }
    
    func test_createModule_returnsViewController() {
        // When
        let controller = CoffeesCoordinator.createModule(navigationController: navigationControllerSpy)
        
        // Then
        XCTAssertTrue(controller is CoffeesViewController)
    }
    
}
