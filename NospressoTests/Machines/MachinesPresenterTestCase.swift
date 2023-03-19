@testable import Nospresso
import XCTest

class MachinesPresenterTestCase: XCTestCase {
    
    var sut: MachinesPresenter!
    
    var viewSpy: MachinesViewControllerSpy!
    var repositoryInputSpy: MachinesRepositoryInputSpy!
    var coordinatorSpy: MachinesCoordinatorSpy!
    
    override func setUpWithError() throws {
        repositoryInputSpy = .init()
        coordinatorSpy = .init()
        viewSpy = .init()

        setupSut()
    }
    
    override func tearDownWithError() throws {
        repositoryInputSpy = nil
        coordinatorSpy = nil
        viewSpy = nil
        sut = nil
    }
    
    func test_viewDidLoad_shouldCallShowLoad_andGetMachines() throws {
        // Given
        setupSut()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(viewSpy.showLoadCalled)
        XCTAssertTrue(repositoryInputSpy.getMachinesCalled)
    }
    
    func setupSut() {
        sut = .init()
        sut.coordinator = coordinatorSpy
        sut.repository = repositoryInputSpy
        sut.view = viewSpy
    }
    
}
