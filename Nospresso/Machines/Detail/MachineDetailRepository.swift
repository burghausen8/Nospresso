import Foundation

internal class MachineDetailRepository {
    
    private weak var output: MachineDetailRepositoryOutputProtocol?
    private var apiClient: API
    
    internal init(output: MachineDetailRepositoryOutputProtocol, apiclient: API = .init()
    ) {
        self.output = output
        self.apiClient = apiclient
    }
    
}

extension MachineDetailRepository: MachineDetailRepositoryInputProtocol {
    
    internal func addToBag(with bag: Bag) {
        
        apiClient.request(endpoint: .bag, method: .post, objetct: bag) { [weak self] (retorno: Bag) in
            self?.output?.addToBagSucceeded()
        } failure: { (erro) in
            self.output?.addToBagFailed()
        }
        
    }
}
