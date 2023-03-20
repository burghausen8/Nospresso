import Foundation

typealias ResultSuccess<T: Decodable> = (T) -> Void
typealias ResultFailure = (RequestError) -> Void

protocol APIProtocolo {
    func request<T>(endpoint: Endpoint, method: MetodoHTTP, objetct: Encodable? ,success: @escaping ResultSuccess<T>, failure: @escaping ResultFailure)
}

class API: APIProtocolo {
    private let baseUrl = "http://localhost:3000"
    
    func request<T>(endpoint: Endpoint, method: MetodoHTTP = .get, objetct: Encodable? = nil, success: @escaping ResultSuccess<T>, failure: @escaping ResultFailure) {
        guard var url = URL(string: baseUrl) else {
            failure(.invalidUrl(message: "url inválida: \(baseUrl)"))
            return
        }
        
        url.appendPathComponent(endpoint.url)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = objetct?.dataJSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard error == nil else {
                failure(.failed(message: error!.localizedDescription))
                return
            }
            
            guard let data = data else {
                failure(.emptyData)
                return
            }
            
            let decode = JSONDecoder()
            do {
                let dataDecode = try decode.decode(T.self, from: data)
                success(dataDecode)
            } catch {
                failure(
                    .decodingFailure(
                        message: error.localizedDescription,
                        receivedData: String(data: data, encoding: .utf8)
                    )
                )
            }
            
            /*
            if let dadosDecodificados = try? decodificador.decode(T.self, from: dados) {
                sucesso(dadosDecodificados)
            }
            */

        }.resume()
    }
    
}
