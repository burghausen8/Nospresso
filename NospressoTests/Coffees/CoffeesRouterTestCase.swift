import XCTest
@testable import Nospresso

class CoffeesRouterTest: XCTestCase {

    var capsules = CoffeesRouter.capsules
    var coffeDetail = CoffeesRouter.coffeeDetail(id: 1)
    
    func test_pathForCapsules_shouldBeCorrect() {
        //Given
        let actualEndpoint = capsules
        
        //When
        let actualPath = actualEndpoint.path
        
        //Then
        XCTAssertEqual(actualPath, "/Capsulas")
    }
    
    func test_pathForCoffeeDetail_shouldBeCorrect() {
        //Given
        let actualEndpoint = coffeDetail
        
        //When
        let actualPath = actualEndpoint.path
        
        //Then
        XCTAssertEqual(actualPath, "/Cafes/Detalhes")
    }
}
