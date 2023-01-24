import XCTest
import Combine
@testable import NetworkKit

final class NetworkKitTests: XCTestCase {
    private var subject: RequestCalling!
    private var serviceMock: ServiceCallingMock!
    private var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        subject = NetworkManager()
        serviceMock = ServiceCallingMock(networkManager: subject)
        cancellables = []
    }

    func test_NetworkManager_callMethod_shouldReturnData() throws {
        let expectation = expectation(description: "expectation")
        var numbersCount = 0

        serviceMock.localEndpointCallerMock()
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTAssertEqual(error, .badURL("file is directory"))
                    expectation.fulfill()
                },
                receiveValue: { object in
                    numbersCount = object.numbers.count
                    expectation.fulfill()
                })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(numbersCount, 6)
    }

    func test_NetworkManager_callMethod_shouldReturnError() throws {
        let expectation = expectation(description: "expectation")
        var firstNumber = 0

        serviceMock.wrongLocalEndpointCallerMock()
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return }
                    XCTAssertEqual(error, .badURL("Error: Invalid url!"))
                    expectation.fulfill()
                },
                receiveValue: { object in
                    firstNumber = object.numbers.first!
                    expectation.fulfill()
                })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(firstNumber, 0)
    }
}
