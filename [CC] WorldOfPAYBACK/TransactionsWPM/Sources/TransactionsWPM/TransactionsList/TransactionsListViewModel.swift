//
//  TransactionsListViewModel.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import NetworkKit
import Combine
import SwiftUI
import UIComponentsKit

final public class TransactionsListViewModel: ObservableObject {

    @Published private var transactions: [TransactionModel] = []
    @Published var filteredTransaction: [TransactionModel] = []
    @Published private var networkChecker = NetworkChecker()

    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var isLoading: Bool = true

    @Published var valueSumOfTransactions: Int = .zero
    let categories: [CategoryWP] = [.one, .two, .three]

    private var fetchingService: TransactionsFetching
    private var subscriptions = Set<AnyCancellable>()

    public init(fetchingService: TransactionsFetching) {
        self.fetchingService = fetchingService

        fetchingService.fetchTransactions()
            .receive(on: DispatchQueue.main)
            .delay(for: 2, scheduler: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                    case .failure(let error):
                        self.errorMessage = error.description
                        self.hasError = true
                    case .finished:
                        break
                }
            } receiveValue: { [weak self] elements in
                guard let self = self else { return }
                self.initialize(with: elements.items)
            }
            .store(in: &subscriptions)
    }

    private func initialize(with entities: [TransactionEntity]) {
        self.transactions = entities.map { self.transformTransactionEntityToModel($0) }
        self.sortTransactionsByBookingDate()
        self.filteredTransaction = transactions
        self.isLoading = false
        self.filterTransactions(by: nil)
    }

    var showDevicIsOfflineView: Bool {
        isLoading || !networkChecker.isConnected
    }

    func filterTransactions(by category: CategoryWP?) {
        if let category = category {
            self.filteredTransaction = transactions.filter({
                $0.category == category.number
            })
            calculateSumOfFilteredTransactions(filteredTransaction)
        } else {
            self.filteredTransaction = transactions
            calculateSumOfFilteredTransactions(filteredTransaction)
        }
    }

    private func calculateSumOfFilteredTransactions(_ transactions: [TransactionModel]) {
        guard networkChecker.isConnected else { return }
        self.valueSumOfTransactions = transactions.map(\.amount).reduce(0, +)
    }

    private func sortTransactionsByBookingDate() {
        self.transactions.sort(by: { $0.bookingDate > $1.bookingDate })
    }
}

extension TransactionsListViewModel {
    private func transformTransactionEntityToModel(_ entity: TransactionEntity) -> TransactionModel {
        return TransactionModel(
            partnerDisplayName: entity.partnerDisplayName ?? "" ,
            reference: entity.alias.reference,
            category: entity.category,
            bookingDate: entity.transactionDetail.bookingDate.formatAndConvertToDate().displayFormat,
            description: entity.transactionDetail.description ?? "",
            amount: entity.transactionDetail.value.amount ?? .zero,
            currency: entity.transactionDetail.value.currency ?? "")
    }
}


