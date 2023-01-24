import Foundation
import Combine

public typealias Headers = [String: String]

public protocol RequestCalling {
    func call<T>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError> where T : Decodable
}

public struct NetworkManager: RequestCalling {

    var requester: Requesting

    public init(requester: Requesting = NetworkRequester()) {
        self.requester = requester
    }

    private func createRequest(for endpoint: Endpoint) -> NetworkRequestBuilder {
        return NetworkRequestBuilder(url: endpoint.getURLString, httpMethod: endpoint.httpMethod)
    }

    public func call<T>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError> where T : Decodable {
        requester.request(source: endpoint.source, request: createRequest(for: endpoint))
    }
}


