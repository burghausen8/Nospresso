@testable import Nospresso
import XCTest
import SnapshotTesting

class AccessoriesViewControllerTestCase: XCTestCase {
    
    var sut: AccessoriesViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        isRecording = false
        
        let presenter = AccessoriesPresenter()
        presenter.repository = AccessoriesRepository(output: presenter)
        
        sut = .init()
        sut.presenter = presenter
        presenter.view = sut
        
        navigationController = .init(rootViewController: sut)
    }
    
    func test_view_withItems_shouldMatchSnapshot() throws {
        sut.presenter?.getAccessoriesSucceeded(Acessories.dummy())
        
        assertSnapshot(matching: navigationController, as: .image)
    }
    
}
