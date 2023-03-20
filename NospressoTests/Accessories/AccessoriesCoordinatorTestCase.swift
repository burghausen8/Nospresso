@testable import Nospresso
import XCTest

class AccessoriesCoordinatorTestCase: XCTestCase {

    var sut: AccessoriesCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_openAccessoryDetail_shouldPushViewController() throws {
        //When
        sut.openAccessoryDetail(with: Acessories.dummy()[0].items[0])
        
        //Then
        XCTAssertTrue(navigationControllerSpy.isPresentCalled)
    }
    
    func test_createModule_returnsViewController() {
        // When
        let controller = MachinesCoordinator.createModule(navigationController: navigationControllerSpy)
        
        // Then
        XCTAssertTrue(controller is MachinesViewController)
    }
    
}
