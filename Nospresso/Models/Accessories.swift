import Foundation

internal struct AccessoriesResponse: Codable {
    
    internal let accessories: [Acessories]
    
    internal enum CodingKeys: String, CodingKey {
        case accessories = "acessorios"
    }
    
}

internal struct Acessories: Codable {
    
    internal let category: String
    internal let items: [Item]
    
    internal enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case items = "itens"
    }
    
}

internal struct Item: Codable {
    
    internal let id: Int
    internal let name: String
    internal let description: String?
    internal let unitValue: Double
    internal let image: String
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case unitValue = "precoUnitario"
        case image = "imagem"
    }
}

extension Item {
    func mapToFavorite() -> Favorite {
        return Favorite(id: id,
                        name: name,
                        description: description ?? "",
                        unitValue: unitValue,
                        image: image,
                        type: .accessory
        )
    }
}

