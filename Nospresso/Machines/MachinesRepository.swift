import Foundation

internal class MachinesRepository {
    
    private weak var output: MachinesRepositoryOutputProtocol?
    private let apiClient: API
    
    internal init(output: MachinesRepositoryOutputProtocol, api: API = .init()
    ) {
        self.output = output
        self.apiClient = api
    }
    
}

extension MachinesRepository: MachinesRepositoryInputProtocol {
    
    internal func getMachines() {
        
        apiClient.request(endpoint: .machines) { [weak self] (machines: [Machine]) in
            guard let self = self else { return }
            
            self.output?.getMachinesSucceeded(machines)
        } failure: { [weak self] (error) in
            self?.output?.getMachinesFailed()
        }
        
    }
}
