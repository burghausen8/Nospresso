import Foundation

internal class BagsRepository {
    
    private weak var output: BagsRepositoryOutputProtocol?
    private var apiClient: API
    
    internal init(output: BagsRepositoryOutputProtocol, apiclient: API = .init()
    ) {
        self.output = output
        self.apiClient = apiclient
    }
    
}

extension BagsRepository: BagsRepositoryInputProtocol {
        
    internal func getBags() {
        
        apiClient.request(endpoint: .bag) { [weak self] (bags: [Bag]) in
            guard let self = self else { return }

            self.output?.getBagsSucceeded(bags)
        } failure: { [weak self] (error) in
            self?.output?.getBagsFailed()
        }
        
    }
    
    internal func removeBag(id: Int) {
        
        apiClient.request(endpoint: .deleteBag(id: id), method: .delete) { (retorno: BagRemoved) in
            print("deu bom")
        } failure: { (erro) in
            print("deu bom")
        }
        
    }
}
