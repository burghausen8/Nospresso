import Foundation
import Alamofire


//MARK: Somente usado caso tenha um back

internal enum AccessoriesRouter: URLRequestConvertible {
    
    case accessories
    
    internal static let baseUrl = "http://localhost:3000"
    
    internal var method: HTTPMethod {
        switch self {
        case .accessories:
            return .get
            
        }
    }
    
    internal var path: String {
        switch self {
        case .accessories:
            return"/Accessorios"
        }
    }
    
    internal func asURLRequest() throws -> URLRequest {
        let url = try AccessoriesRouter.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        switch self {
        case let .accessories:
            var parameters = Parameters()
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
}
