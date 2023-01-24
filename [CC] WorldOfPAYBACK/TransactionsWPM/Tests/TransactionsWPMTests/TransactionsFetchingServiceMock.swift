//
//  TransactionsFetchingServiceMock.swift
//  
//
//  Created by Amel Dizdarevic on 1/24/23.
//

import Foundation
import TransactionsWPM
import Combine
import NetworkKit

final class TransactionsFetchingServiceMock: TransactionsFetching {

    let mockedSample = TransactionsObjectMock().mockedSample

    var networkManager = NetworkManager()

    func fetchTransactions() -> AnyPublisher<TransactionsObject, NetworkError> {
        return Just(mockedSample)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}


