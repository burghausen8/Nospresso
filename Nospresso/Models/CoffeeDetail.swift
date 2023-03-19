internal struct CoffeeDetailResponse: Codable {
    
    internal let coffees: [CoffeeDetail]
    
    internal enum CodingKeys: String, CodingKey {
        case coffees = "cafes"
    }
    
}

internal struct CoffeeDetail: Codable {
    
    internal let id: Int
    internal let name: String
    internal let description: String
    internal let intensity: Int
    internal let unitValue: Double
    internal let image: String
    internal let measurements: [String]
    internal let origin: String
    internal let roasting: String
    internal let perfil: String
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case intensity = "intensidade"
        case unitValue = "precoUnitario"
        case image = "imagem"
        case measurements = "medidas"
        case origin = "origem"
        case roasting = "torrefacao"
        case perfil = "perfil aromatico"
    }
}
