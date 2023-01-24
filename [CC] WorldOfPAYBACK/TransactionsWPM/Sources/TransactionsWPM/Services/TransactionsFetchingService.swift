//
//  TransactionsFetchingService.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import Combine
import NetworkKit

public protocol TransactionsFetching {
    func fetchTransactions() -> AnyPublisher<TransactionsObject, NetworkError>
}

final public class TransactionsFetchingService: TransactionsFetching {
    public var networkManager: RequestCalling

    public init(networkManager: RequestCalling) {
        self.networkManager = networkManager
    }

    public func fetchTransactions() -> AnyPublisher<TransactionsObject, NetworkError> {
        Bool.random() ? networkManager.call(endpoint: .init(endpoint: .getMockData(fileName: "PBTransactions"), configuration: .stage)) : failWithError
    }

    private var failWithError: AnyPublisher<TransactionsObject, NetworkError> {
        Fail(error: NetworkError.apiError(code: 503)).eraseToAnyPublisher()
    }
}
