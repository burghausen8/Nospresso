import Foundation

internal class AccessoryDetailRepository {
    
    private weak var output: AccessoryDetailRepositoryOutputProtocol?
    private var apiClient: API
    
    internal init(output: AccessoryDetailRepositoryOutputProtocol, apiclient: API = .init()
    ) {
        self.output = output
        self.apiClient = apiclient
    }
    
}

extension AccessoryDetailRepository: AccessoryDetailRepositoryInputProtocol {
    
    internal func addToBag(with bag: Bag) {
        
        apiClient.request(endpoint: .bag, method: .post, objetct: bag) { [weak self] (retorno: Bag) in
            self?.output?.addToBagSucceeded()
        } failure: { (erro) in
            self.output?.addToBagFailed()
        }
        
    }
}
