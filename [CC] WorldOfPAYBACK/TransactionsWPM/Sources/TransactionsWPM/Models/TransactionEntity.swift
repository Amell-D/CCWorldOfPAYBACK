//
//  TransactionModel.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import UIComponentsKit

public struct TransactionsObject: Decodable {
    let items: [TransactionEntity]

    public init(items: [TransactionEntity]) {
        self.items = items
    }
}

public struct TransactionEntity: Decodable {
    let partnerDisplayName: String?
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail

    enum CodingKeys: CodingKey {
        case partnerDisplayName
        case alias
        case category
        case transactionDetail
    }

    public init(partnerDisplayName: String? = nil, alias: Alias, category: Int, transactionDetail: TransactionDetail) {
        self.partnerDisplayName = partnerDisplayName
        self.alias = alias
        self.category = category
        self.transactionDetail = transactionDetail
    }
}

public struct Alias: Decodable {
    let reference: String

    public init(reference: String) {
        self.reference = reference
    }
}

public struct TransactionDetail: Decodable {
    let bookingDate: String
    let description: String?
    let value: Value

    enum CodingKeys: CodingKey {
        case bookingDate
        case description
        case value
    }

    public init(bookingDate: String, description: String? = nil, value: Value) {
        self.bookingDate = bookingDate
        self.description = description
        self.value = value
    }
}

public struct Value: Decodable {
    let amount: Int?
    let currency: String?

    public init(amount: Int?, currency: String?) {
        self.amount = amount
        self.currency = currency
    }
}
