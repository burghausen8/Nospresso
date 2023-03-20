import Foundation

enum RequestError: Error {
    case invalidUrl(message: String)
    case failed(message: String)
    case emptyData
    case decodingFailure(message: String, receivedData: String?)
}
