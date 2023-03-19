@testable import Nospresso
import XCTest

class AccessoriesPresenterTestCase: XCTestCase {
    
    var sut: AccessoriesPresenter!
    
    var viewSpy: AccessoriesViewControllerSpy!
    var repositoryInputSpy: AccessoriesRepositoryInputSpy!
    var coordinatorSpy: AccessoriesCoordinatorSpy!
    
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
    
    func test_viewDidLoad_shouldCallShowLoad_andGetAccessories() throws {
        // Given
        setupSut()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(viewSpy.showLoadCalled)
        XCTAssertTrue(repositoryInputSpy.getAccessoriesCalled)
    }
    
    func setupSut() {
        sut = .init()
        sut.coordinator = coordinatorSpy
        sut.repository = repositoryInputSpy
        sut.view = viewSpy
    }
    
}
