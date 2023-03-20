import Foundation

internal class CoffeesRepository {
    
    private weak var output: CoffeesRepositoryOutputProtocol?
    private var apiClient: API
    
    internal init(output: CoffeesRepositoryOutputProtocol, apiclient: API = .init()
    ) {
        self.output = output
        self.apiClient = apiclient
    }
    
}

extension CoffeesRepository: CoffeesRepositoryInputProtocol {
    
    internal func getCoffeeDetail(id: Int) {
        
        apiClient.request(endpoint: .coffeeDetail(id: id)) { [weak self] (coffeeDetail: CoffeeDetail) in
            guard let self = self else { return }

            self.output?.getCoffeeDetailSucceeded(coffeeDetail)
        } failure: { [weak self] (error) in
            self?.output?.getCoffeeDetailFailed()
        }
    }
    
    internal func getCapsules() {
        
        apiClient.request(endpoint: .capsules) { [weak self] (capsules: [Capsules]) in
            guard let self = self else { return }

            self.output?.getCapsulesSucceeded(capsules)
        } failure: { [weak self] (error) in
            self?.output?.getCapsulesFailed()
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
