@testable import Nospresso
import XCTest
import SnapshotTesting

class CoffeeDetailViewControllerTestCase: XCTestCase {
    
    var sut: CoffeeDetailViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        isRecording = false
        
        let presenter = CoffeeDetailPresenter(coffee: CoffeeDetailResponse.dummy().coffees[0])
        
        sut = .init()
        sut.presenter = presenter
        presenter.view = sut
        
        navigationController = .init(rootViewController: sut)
    }
    
    func test_view_withItems_shouldMatchSnapshot() throws {
        sut.presenter?.viewDidLoad()
        
        assertSnapshot(matching: navigationController, as: .image)
    }
    
}
