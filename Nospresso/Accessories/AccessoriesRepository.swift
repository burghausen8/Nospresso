import Foundation

internal class AccessoriesRepository {
    
    private weak var output: AccessoriesRepositoryOutputProtocol?
    
    internal init(output: AccessoriesRepositoryOutputProtocol
    ) {
        self.output = output
    }
    
    private func getRouter() -> AccessoriesRouter {
        return .accessories
    }
    
}

extension AccessoriesRepository: AccessoriesRepositoryInputProtocol {
    
    internal func getAccessories() {
        
        //TODO: comentado, pois precisa de um back para funcionar, estou mockando os resultados para poder ver as telas
        
        //timer apenas apra ver o loading funcionando
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sendAccessories), userInfo: nil, repeats: false)
    }
    
    @objc internal func sendAccessories() {
        self.output?.getAccessoriesSucceeded(AccessoriesResponse.dummy())
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
