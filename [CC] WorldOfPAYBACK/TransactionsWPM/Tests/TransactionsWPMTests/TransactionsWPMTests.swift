import XCTest
import Combine
@testable import TransactionsWPM

final class TransactionsWPMTests: XCTestCase {

    var subject: TransactionsListViewModel!
    var fetchingService: TransactionsFetchingServiceMock!

    override func setUpWithError() throws {
        self.fetchingService = TransactionsFetchingServiceMock()
        self.subject = TransactionsListViewModel(fetchingService: fetchingService)
    }

    func test_TransactionsListViewModel_filteredTransaction_shouldReturnAllTransactions() throws {

        let allMockedTransactionsCount = 5
        let testSubject = subject.$filteredTransaction
            .dropFirst()
            .collect(2)
            .first()

        let testSubjectPublisher = try awaitPublisher(testSubject).first
        XCTAssertEqual(testSubjectPublisher?.count, allMockedTransactionsCount)
    }

    func test_TransactionsListViewModel_filteredTransaction_first_shouldReturnEqualPartnerDisplayName() throws {
        let firstTransactionPartnerDisplayName = fetchingService.mockedSample.items.first?.partnerDisplayName
        let testSubject = subject.$filteredTransaction
            .dropFirst()
            .collect(2)
            .first()

        let testSubjectPublisher = try awaitPublisher(testSubject).first
        XCTAssertEqual(testSubjectPublisher?.first?.partnerDisplayName, firstTransactionPartnerDisplayName)
    }
}


