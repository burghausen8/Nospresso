import Foundation

enum TypeProduct: String, Codable {
    case machine = "maquina"
    case coffee = "cafe"
    case accessory = "acessorio"
}

internal struct Favorite: Codable {
    
    internal let id: Int
    internal let name: String
    internal let description: String
    internal let unitValue: Double
    internal let image: String
    internal let type: TypeProduct
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case unitValue = "precoUnitario"
        case image = "imagem"
        case type = "tipo"
    }
}
