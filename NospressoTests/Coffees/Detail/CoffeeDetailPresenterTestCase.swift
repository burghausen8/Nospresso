@testable import Nospresso
import XCTest

class CoffeeDetailPresenterTestCase: XCTestCase {
    
    var sut: CoffeeDetailPresenter!
    
    var viewSpy: CoffeeDetailViewControllerSpy!
    
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
    
    func setupSut() {
        sut = .init(coffee: CoffeeDetailResponse.dummy().coffees[0])
        sut.view = viewSpy
    }
    
}
