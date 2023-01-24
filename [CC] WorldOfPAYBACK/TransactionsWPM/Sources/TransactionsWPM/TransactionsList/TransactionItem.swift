//
//  TransactionItem.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

struct TransactionItem: View {

    var transaction: TransactionModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(transaction.partnerDisplayName)
                    .font(.title2)
                Text(transaction.description)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                HStack {
                    Text("\(transaction.amount)")
                    Text(transaction.currency)
                }
                Text(transaction.bookingDate)
                    .font(.caption)
            }
            .font(.callout)
        }
        .foregroundColor(.white)
        .padding()
    }
}
