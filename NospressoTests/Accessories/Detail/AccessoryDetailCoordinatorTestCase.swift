@testable import Nospresso
import XCTest

class AccessoryDetailCoordinatorTestCase: XCTestCase {

    var sut: AccessoryDetailCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_createModule_returnsViewController() {
        // When
        let controller = AccessoryDetailCoordinator.createModule(navigationController: navigationControllerSpy, accessory: Acessories.dummy()[0].items[0])
        
        // Then
        XCTAssertTrue(controller is AccessoryDetailViewController)
    }
    
}
