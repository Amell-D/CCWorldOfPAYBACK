import Foundation

public protocol RequestBuilding {
    var urlString: String { get }
    func build(with url: URL) -> URLRequest
}

public struct NetworkRequestBuilder: RequestBuilding {
    // In future, this struct can be modified to take specific headers and all other properties
    public var urlString: String
    let httpMethod: HTTPMethod

    public init(url: String, httpMethod: HTTPMethod) {
        self.urlString = url
        self.httpMethod = httpMethod
    }

    public func build(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        return urlRequest
    }
}
