@testable import Nospresso
import XCTest
import SnapshotTesting

class MachinesViewControllerTestCase: XCTestCase {
    
    var sut: MachinesViewController!
    var navigationController: UINavigationController!
    
    override func setUp() {
        isRecording = false
        
        let presenter = MachinesPresenter()
        presenter.repository = MachinesRepository(output: presenter)
        
        sut = .init()
        sut.presenter = presenter
        presenter.view = sut
        
        navigationController = .init(rootViewController: sut)
    }
    
    func test_view_withItems_shouldMatchSnapshot() throws {
        sut.presenter?.getMachinesSucceeded(Machine.dummy())
        
        assertSnapshot(matching: navigationController, as: .image)
    }
    
}
