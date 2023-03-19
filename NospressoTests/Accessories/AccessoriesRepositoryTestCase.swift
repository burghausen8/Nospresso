@testable import Nospresso
import XCTest

class AccessoriesRepositoryTestCase: XCTestCase {
    
    var sut: AccessoriesRepository!

    var outputSpy: AccessoriesRepositoryOutputSpy!
    
    override func setUp() {
        outputSpy = .init()
        
        sut = .init(output: outputSpy)
    }
    
    
    func test_getMachines_whenSucceeds_shouldCallOutput() throws {
        throw XCTSkip("este testa irá quebrar por conta do timer no mock do repository")
        //When
        sut.getAccessories()
        
        //Then
        XCTAssertTrue(outputSpy.getAccessoriesSucceededCalled)
    }
}
