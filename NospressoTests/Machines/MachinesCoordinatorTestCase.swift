@testable import Nospresso
import XCTest

class MachinesCoordinatorTestCase: XCTestCase {

    var sut: MachinesCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_openMachineDetail_shouldPushViewController() throws {
        //When
        sut.openMachineDetail(with: Machine.dummy()[0])
        
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
