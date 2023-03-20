import Foundation

enum Endpoint {
    case bag
    case deleteBag(id: Int)
    case coffeeDetail(id: Int)
    case capsules
    case accessories
    case machines
    
    var url: String {
        switch self {
        case .bag:
            return "sacola/"
        case .deleteBag(let id):
            return "sacola/\(id)"
        case .coffeeDetail(let id):
            return "cafes/\(id)"
        case .capsules:
            return "capsulas/"
        case .accessories:
            return "acessorios/"
        case .machines:
            return "maquinas/"
        default:
            return "\(self)"
        }
    }
}

enum MetodoHTTP: String {
    case post
    case get
    case delete
}

extension Encodable {
    var dataJSON: Data? { try? JSONEncoder().encode(self) }
}
