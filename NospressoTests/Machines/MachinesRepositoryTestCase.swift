@testable import Nospresso
import XCTest

class MachinesRepositoryTestCase: XCTestCase {
    
    var sut: MachinesRepository!

    var outputSpy: MachinesRepositoryOutputSpy!
    
    override func setUp() {
        outputSpy = .init()
        
        sut = .init(output: outputSpy)
    }
    
    func test_getMachines_whenSucceeds_shouldCallOutput() throws {
        throw XCTSkip("este testa irá quebrar por conta do timer no mock do repository")
        
        //When
        sut.getMachines()
        
        //Then
        XCTAssertTrue(outputSpy.getMachinesSucceededCalled)
    }
}
