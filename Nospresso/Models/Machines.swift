import Foundation

internal struct MachinesResponse: Codable {
    
    internal let machines: [Machine]
    
    internal enum CodingKeys: String, CodingKey {
        case machines = "maquinas"
    }
    
}

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
        case unitValue = "precoUnitario"
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
}

