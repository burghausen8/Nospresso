import Foundation

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
        case unitValue = "preco"
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
    func mapToBag() -> Bag {
        return Bag(id: Int.random(in: 0..<100000),
                   originalId: id,
                   name: name,
                   description: description ?? "",
                   unitValue: unitValue,
                   image: image,
                   type: .accessory
        )
    }
    
}

