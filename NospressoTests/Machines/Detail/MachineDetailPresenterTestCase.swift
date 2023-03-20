@testable import Nospresso
import XCTest

class MachineDetailPresenterTestCase: XCTestCase {
    
    var sut: MachineDetailPresenter!
    
    var viewSpy: MachineDetailViewControllerSpy!
    
    override func setUpWithError() throws {
        viewSpy = .init()

        setupSut()
    }
    
    override func tearDownWithError() throws {
        viewSpy = nil
        sut = nil
    }
    
    func test_viewDidLoad_shouldCallSetup() throws {
        // Given
        setupSut()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(viewSpy.setupCalled)
    }
    
    func test_bagButtonTapped_shouldCallShowAllert() throws {
        // Given
        setupSut()
        
        // When
        sut.bagButtonTapped()
        
        // Then
        XCTAssert(viewSpy.showAlertCalled)
    }
    
    func setupSut() {
        sut = .init(machine: Machine.dummy()[0])
        sut.view = viewSpy
    }
    
}
