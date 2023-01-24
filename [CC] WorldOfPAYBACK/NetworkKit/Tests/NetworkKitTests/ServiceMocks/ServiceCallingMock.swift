import Foundation
import Combine
import NetworkKit

struct MockModel: Codable {
    let numbers: [Int]
}

final class ServiceCallingMock {
    var networkManager: RequestCalling

    init(networkManager: RequestCalling) {
        self.networkManager = networkManager
    }

    func localEndpointCallerMock() -> AnyPublisher<MockModel, NetworkError> {
        networkManager.call(endpoint: .init(endpoint: .getMockData(fileName: "MockData"), configuration: .test))
    }

    func wrongLocalEndpointCallerMock() -> AnyPublisher<MockModel, NetworkError> {
        networkManager.call(endpoint: .init(endpoint: .getMockData(fileName: "WrongMockFileName"), configuration: .test))
    }
}
