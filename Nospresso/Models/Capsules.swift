import Foundation

internal struct Capsules: Codable {
    
    internal let category: String
    internal let coffees: [Coffee]
    
    internal enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case coffees = "cafes"
    }
    
}

internal struct Coffee: Codable {
    
    internal let id: Int
    internal let name: String
    internal let description: String
    internal let intensity: Int?
    internal let unitValue: Double
    internal let image: String
    internal let measurements: [String]
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case intensity = "intensidade"
        case unitValue = "precoUnitario"
        case image = "imagem"
        case measurements = "medidas"
    }
}

extension Coffee {
    func mapToFavorite() -> Favorite {
        return Favorite(id: id,
                        name: name,
                        description: description,
                        unitValue: unitValue,
                        image: image,
                        type: .coffee
        )
    }
    
    func mapToBag() -> Bag {
        return Bag(id: Int.random(in: 0..<100000),
                   originalId: id,
                   name: name,
                   description: description,
                   unitValue: unitValue,
                   image: image,
                   type: .coffee
        )
    }
}
