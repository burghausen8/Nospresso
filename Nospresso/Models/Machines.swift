import Foundation

internal struct Machine: Codable {
    
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

extension Machine {
    func mapToFavorite() -> Favorite {
        return Favorite(id: id,
                        name: name,
                        description: description ?? "",
                        unitValue: unitValue,
                        image: image,
                        type: .machine
        )
    }
    func mapToBag() -> Bag {
        return Bag(id: Int.random(in: 0..<100000),
                   originalId: id,
                   name: name,
                   description: description ?? "",
                   unitValue: unitValue,
                   image: image,
                   type: .machine
        )
    }
}

