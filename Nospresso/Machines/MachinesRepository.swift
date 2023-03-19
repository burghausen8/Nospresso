import Foundation

internal class MachinesRepository {
    
    private weak var output: MachinesRepositoryOutputProtocol?
    
    internal init(output: MachinesRepositoryOutputProtocol
    ) {
        self.output = output
    }
    
    private func getRouter(id: Int) -> MachinesRouter {
        return .machines
    }
    
}

extension MachinesRepository: MachinesRepositoryInputProtocol {
    
    internal func getMachines() {
        
        //TODO: comentado, pois precisa de um back para funcionar, estou mockando os resultados para poder ver as telas
        
        //timer apenas apra ver o loading funcionando
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sendMachines), userInfo: nil, repeats: false)
    }
    
    @objc internal func sendMachines() {
        self.output?.getMachinesSucceeded(MachinesResponse.dummy())
    }
    
    //        apiClient.requestJSON(urlRequest: self.getRouter(id: id)) { [weak self] (result: Result<CoffeeDetailResponse>) in
    //                switch result {
    //                case .success(let data):
    //                    self?.output?.getCoffeDetailSucceeded(data.coffees)
    //                case .error(let error):
    //                    self?.output?.getCoffeeDetailFailed(error.message)
    //                }
    //            }
    
}
