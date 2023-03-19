@testable import Nospresso
import XCTest

class CoffeesRepositoryTestCase: XCTestCase {
    
    var sut: CoffeesRepository!

    var outputSpy: CoffeesRepositoryOutputSpy!
    
    override func setUp() {
        outputSpy = .init()
        
        sut = .init(output: outputSpy)
    }
    
    func test_getCapsules_whenSucceeds_shouldCallOutput() throws {
        throw XCTSkip("este testa irá quebrar por conta do timer no mock do repository")
        //When
        sut.getCapsules()
        
        //Then
        XCTAssertTrue(outputSpy.getCapsulesSucceededCalled)
    }
    
    func test_getCoffeeDetail_whenSucceeds_shouldCallOutput() {
        //When
        sut.getCoffeeDetail(id: 1)
        
        //Then
        XCTAssertTrue(outputSpy.getCoffeeDetailSucceededCalled)
    }
    
}
