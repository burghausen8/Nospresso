import Foundation
import Alamofire

//MARK: Somente usado caso tenha um back

internal enum CoffeesRouter: URLRequestConvertible {
    
    case coffeeDetail(id: Int)
    case capsules
    
    internal static let baseUrl = "http://localhost:3000"
    
    internal var method: HTTPMethod {
        switch self {
        case .coffeeDetail, .capsules:
            return .get
            
        }
    }
    
    internal var path: String {
        switch self {
        case .coffeeDetail:
            return "/Cafes/Detalhes"
        case .capsules:
            return"/Capsulas"
        }
    }
    
    internal func asURLRequest() throws -> URLRequest {
        let url = try CoffeesRouter.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        switch self {
        case let .coffeeDetail(id):
            var parameters = Parameters()
            parameters.updateValue(id, forKey: "id")
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case let .capsules:
            var parameters = Parameters()
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
}
