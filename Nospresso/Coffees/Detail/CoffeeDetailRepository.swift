import Foundation

internal class CoffeeDetailRepository {
    
    private weak var output: CoffeeDetailRepositoryOutputProtocol?
    private var apiClient: API
    
    internal init(output: CoffeeDetailRepositoryOutputProtocol, apiclient: API = .init()
    ) {
        self.output = output
        self.apiClient = apiclient
    }
    
}

extension CoffeeDetailRepository: CoffeeDetailRepositoryInputProtocol {
    
    internal func addToBag(with bag: Bag) {
        
        apiClient.request(endpoint: .bag, method: .post, objetct: bag) { [weak self] (retorno: Bag) in
            self?.output?.addToBagSucceeded()
        } failure: { (erro) in
            self.output?.addToBagFailed()
        }
        
    }
}
