import Foundation

internal class CoffeesRepository {
    
    private weak var output: CoffeesRepositoryOutputProtocol?
    
    internal init(output: CoffeesRepositoryOutputProtocol
    ) {
        self.output = output
    }
    
    private func getRouter(id: Int) -> CoffeesRouter {
        return .coffeeDetail(id: id)
    }
    
}

extension CoffeesRepository: CoffeesRepositoryInputProtocol {
    
    internal func getCoffeeDetail(id: Int) {
        
        //TODO: comentado, pois precisa de um back para funcionar, estou mockando os resultados para poder ver as telas
        if let coffeeDetails = CoffeeDetailResponse.dummy().coffees.first(where: {$0.id == id}) {
            self.output?.getCoffeeDetailSucceeded(coffeeDetails)
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
    
    internal func getCapsules() {
        
        //TODO: comentado, pois precisa de um back para funcionar, estou mockando os resultados para poder ver as telas
        //timer apenas apra ver o loading funcionando
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sendCapsules), userInfo: nil, repeats: false)
    }
    
    @objc internal func sendCapsules() {
        self.output?.getCapsulesSucceeded(CapsulesResponse.dummy())
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
