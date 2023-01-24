import Foundation
import Combine

public protocol Requesting {
    func request<T>(source: DataSource, request: RequestBuilding) -> AnyPublisher<T, NetworkError> where T: Decodable
}

public struct NetworkRequester: Requesting {

    public init() { }

    public func request<T>(source: DataSource, request: RequestBuilding) -> AnyPublisher<T, NetworkError> where T : Decodable {
        guard let url = URL(string: request.urlString) else {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL))
        }
        return URLSession.shared.dataTaskPublisher(for: request.build(with: url))
            .retry(3)
            .tryMap { output in
                guard source != .local else { return output.data }
                guard
                    let httpResponse = output.response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.serverError(code: 503)
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error  in
                switch error {
                    case is DecodingError: return NetworkError.unableToParseData
                    case is URLError: return NetworkError.badURL
                    default: return NetworkError.thrownError(error: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
}
