import XCTest
@testable import Nospresso

class MachinesRouterTest: XCTestCase {

    var machines = MachinesRouter.machines
    
    func test_pathForMachines_shouldBeCorrect() {
        //Given
        let actualEndpoint = machines
        
        //When
        let actualPath = actualEndpoint.path
        
        //Then
        XCTAssertEqual(actualPath, "/Maquinas")
    }
}
