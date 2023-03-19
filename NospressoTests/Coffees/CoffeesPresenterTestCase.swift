@testable import Nospresso
import XCTest

class CoffeesPresenterTestCase: XCTestCase {
    
    var sut: CoffeesPresenter!
    
    var viewSpy: CoffeesViewControllerSpy!
    var repositoryInputSpy: CoffeesRepositoryInputSpy!
    var coordinatorSpy: CoffeesCoordinatorSpy!
    
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
    
    func test_viewDidLoad_shouldCallShowLoad_andGetCapsules() throws {
        // Given
        setupSut()

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(viewSpy.showLoadCalled)
        XCTAssertTrue(repositoryInputSpy.getCapsulesCalled)
    }
    
    func setupSut() {
        sut = .init()
        sut.coordinator = coordinatorSpy
        sut.repository = repositoryInputSpy
        sut.view = viewSpy
    }
    
}
