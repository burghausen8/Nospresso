import Foundation

internal class AccessoriesRepository {
    
    private weak var output: AccessoriesRepositoryOutputProtocol?
    private let apiClient: API
    
    internal init(output: AccessoriesRepositoryOutputProtocol, api: API = .init()
    ) {
        self.output = output
        self.apiClient = api
    }
    
}

extension AccessoriesRepository: AccessoriesRepositoryInputProtocol {
    
    internal func getAccessories() {
        
        apiClient.request(endpoint: .accessories) { [weak self] (accessories: [Acessories]) in
            guard let self = self else { return }
            
            self.output?.getAccessoriesSucceeded(accessories)
        } failure: { [weak self] (error) in
            self?.output?.getAccessoriesFailed()
        }
        
    }
    
    internal func addToBag(with bag: Bag) {
        
        apiClient.request(endpoint: .bag, method: .post, objetct: bag) { [weak self] (retorno: Bag) in
            self?.output?.addToBagSucceeded()
        } failure: { (erro) in
            self.output?.addToBagFailed()
        }
        
    }
}
