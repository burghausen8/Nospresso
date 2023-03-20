@testable import Nospresso
import XCTest
import SnapshotTesting

class AccessoryDetailViewControllerTestCase: XCTestCase {
    
    var sut: AccessoryDetailViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        isRecording = false
        
        let presenter = AccessoryDetailPresenter(accessory: Acessories.dummy()[0].items[0])
        
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
