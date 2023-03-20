import Foundation

internal struct Bag: Codable {
    
    internal let id: Int
    internal let originalId: Int
    internal let name: String
    internal let description: String
    internal let unitValue: Double
    internal let image: String
    internal let type: TypeProduct
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case originalId = "idOriginal"
        case name = "nome"
        case description = "descricao"
        case unitValue = "preco"
        case image = "imagem"
        case type = "tipo"
    }
}

struct BagRemoved: Decodable {

}
