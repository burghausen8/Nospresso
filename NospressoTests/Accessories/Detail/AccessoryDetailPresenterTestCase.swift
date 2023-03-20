@testable import Nospresso
import XCTest

class AccessoryDetailPresenterTestCase: XCTestCase {
    
    var sut: AccessoryDetailPresenter!
    
    var viewSpy: AccessoryDetailViewControllerSpy!
    
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
        sut = .init(accessory: Acessories.dummy()[0].items[0])
        sut.view = viewSpy
    }
    
}
