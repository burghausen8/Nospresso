@testable import Nospresso
import XCTest
import SnapshotTesting

class CoffeesViewControllerTestCase: XCTestCase {
    
    var sut: CoffeesViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        isRecording = false
        
        let presenter = CoffeesPresenter()
        presenter.repository = CoffeesRepository(output: presenter)
        
        sut = .init()
        sut.presenter = presenter
        presenter.view = sut
        
        navigationController = .init(rootViewController: sut)
    }
    
    func test_view_withItems_shouldMatchSnapshot() throws {
        sut.presenter?.getCapsulesSucceeded(CapsulesResponse.dummy())
        
        assertSnapshot(matching: navigationController, as: .image)
    }
    
}
