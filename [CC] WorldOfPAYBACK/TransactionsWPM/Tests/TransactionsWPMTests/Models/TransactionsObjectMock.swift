//
//  TransactionsObjectMock.swift
//  
//
//  Created by Amel Dizdarevic on 1/24/23.
//

import Foundation
import TransactionsWPM

struct TransactionsObjectMock {
    let mockedSample = TransactionsObject(items: [
        TransactionEntity(
            partnerDisplayName: "Partner 1",
            alias: Alias(reference: "795357452000810"),
            category: 1,
            transactionDetail:
                TransactionDetail(
                    bookingDate: "2022-07-24T10:59:05+0200",
                    description: "Description 1",
                    value:
                        Value(
                            amount: 10,
                            currency: "PBP"))),
        TransactionEntity(
            partnerDisplayName: "Partner 2",
            alias: Alias(reference: "795357452000811"),
            category: 2,
            transactionDetail:
                TransactionDetail(
                    bookingDate: "2022-06-23T10:59:05+0200",
                    description: "Description 2",
                    value:
                        Value(
                            amount: 20,
                            currency: "PBP"))),
        TransactionEntity(
            partnerDisplayName: "Partner 3",
            alias: Alias(reference: "795357452000812"),
            category: 3,
            transactionDetail:
                TransactionDetail(
                    bookingDate: "2022-07-22T10:59:05+0200",
                    description: "Description 3",
                    value:
                        Value(
                            amount: 30,
                            currency: "PBP"))),
        TransactionEntity(
            partnerDisplayName: "Partner 4",
            alias: Alias(reference: "795357452000813"),
            category: 1,
            transactionDetail:
                TransactionDetail(
                    bookingDate: "2022-04-10T10:59:05+0200",
                    description: "Description 4",
                    value:
                        Value(
                            amount: 40,
                            currency: "PBP"))),
        TransactionEntity(
            partnerDisplayName: "Partner 5",
            alias: Alias(reference: "795357452000814"),
            category: 2,
            transactionDetail:
                TransactionDetail(
                    bookingDate: "2022-03-25T10:59:05+0200",
                    description: "Description 5",
                    value:
                        Value(
                            amount: 50,
                            currency: "PBP")))
            ])
}
