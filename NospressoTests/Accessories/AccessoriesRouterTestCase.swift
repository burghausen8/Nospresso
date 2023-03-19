import XCTest
@testable import Nospresso

class AccessoriesRouterTest: XCTestCase {

    var accessories = AccessoriesRouter.accessories
    
    func test_pathForAccessories_shouldBeCorrect() {
        //Given
        let actualEndpoint = accessories
        
        //When
        let actualPath = actualEndpoint.path
        
        //Then
        XCTAssertEqual(actualPath, "/Accessorios")
    }
}
