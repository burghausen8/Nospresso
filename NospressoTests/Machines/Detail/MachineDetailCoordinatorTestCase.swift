@testable import Nospresso
import XCTest

class MachineDetailCoordinatorTestCase: XCTestCase {

    var sut: MachineDetailCoordinator!
    var navigationControllerSpy: NavigationControllerSpy!
    
    override func setUp() {
        navigationControllerSpy = .init(rootViewController: UIViewController())
        
        sut = .init(navigationController: navigationControllerSpy)
    }
    
    func test_createModule_returnsViewController() {
        // When
        let controller = MachineDetailCoordinator.createModule(navigationController: navigationControllerSpy, machine: Machine.dummy()[0])
        
        // Then
        XCTAssertTrue(controller is MachineDetailViewController)
    }
    
}
