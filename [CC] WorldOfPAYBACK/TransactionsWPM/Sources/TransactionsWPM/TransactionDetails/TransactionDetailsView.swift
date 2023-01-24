//
//  TransactionDetailsView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI
import UIComponentsKit

public struct TransactionDetailsView: View {

    var transaction: TransactionModel

    public init(for transaction: TransactionModel) {
        self.transaction = transaction
    }

    public var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(transaction.partnerDisplayName)
                    .font(Font.system(size: 26, weight: .semibold))
                    .foregroundColor(.white)
                ZStack {
                    PrimaryBackgroundContainerView()
                        .cornerRadius(8)
                        .padding(10)
                        .padding(.horizontal, 30)

                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text("Description")
                                .font(.headline)
                            Text(":")
                            Text(transaction.description)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
}
