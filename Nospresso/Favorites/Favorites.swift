import UIKit

class Favorites {
    
    static let instance = Favorites()
    let keyFavorites = "NospressoFavorites"
    
    var itens: [Favorite] = []
    
    let userPatterns = UserDefaults.standard
    
    private init() {
        getToLocalStorage()
    }
    
    /// Alterna um produto na lista de favoritos.
    /// - Parameter produto: Produto a ser adicionado/removido.
    /// - Returns: true se foi adicionado, false se foi removido da lista.
    /// fazer mais dois, um para acessorios e um para maquinas
    func toggle(with favorite: Favorite) -> Bool {
        defer {
            updateLocalStorage()
        }
        
        if let existingProduct = itens.firstIndex(where: {$0.id == favorite.id && $0.type == favorite.type}) {
            itens.remove(at: existingProduct)
            return false
        } else {
            itens.append(favorite)
            return true
        }
    }
    
    
    /// Remove um produto da lista de favoritos.
    /// - Parameter produto: Produto a ser removido.
    func remove(favorite: Favorite) {
        if let existingProduct = itens.firstIndex(where: {$0.id == favorite.id && $0.type == favorite.type}) {
            itens.remove(at: existingProduct)
        }
        
        updateLocalStorage()
    }
    
    
    /// Verifica se um produto está na lista de favoritos.
    /// - Parameter produto: Produto a ser verificado.
    /// - Returns: true caso esteja, false caso contrário.
    func checkIfOnTheList(favorite: Favorite) -> Bool {
        itens.contains(where: {$0.id == favorite.id && $0.type == favorite.type})
    }
    
}

private extension Favorites {
    func updateLocalStorage() {
        guard let dadosJson =  try? JSONEncoder().encode(itens) else { return }
        
        userPatterns.setValue(dadosJson, forKey: keyFavorites)
    }
    
    func getToLocalStorage() {
        guard let jsonData = userPatterns.data(forKey: keyFavorites),
              let decodeFavorites = try? JSONDecoder().decode([Favorite].self, from: jsonData) else { return }
        
        self.itens = decodeFavorites
    }
}

protocol toggleInFavoritesDelegate: AnyObject {
    func alternate(for favoritaded: Bool)
}
