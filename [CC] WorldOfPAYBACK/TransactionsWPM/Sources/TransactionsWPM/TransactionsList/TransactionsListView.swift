//
//  TransactionsListView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI
import NetworkKit
import UIComponentsKit
import NavigationCoordinatorKit

public struct TransactionsListView: View {

    @ObservedObject public var viewModel: TransactionsListViewModel
    var coordinator: TransactionsCoordinatorProtocol

    public init(
        viewModel: TransactionsListViewModel,
        coordinator: TransactionsCoordinatorProtocol
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }

    public var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    FilterView {
                        ForEach(viewModel.categories, id:\.self) { category in
                            Button {
                                viewModel.filterTransactions(by: category)
                            } label: {
                                Text("Category \(category.number)")
                            }
                        }
                        Button("All") {
                            viewModel.filterTransactions(by: nil)
                        }
                    }
                    Spacer()
                    PrimaryButton(text: "SUM: \(viewModel.valueSumOfTransactions) PBP")
                    .padding(.trailing, 10)
                }
                Spacer()
                if viewModel.showDevicIsOfflineView {
                    DeviceOfflineView(isLoading: $viewModel.isLoading)
                } else {
                    ZStack {
                        PrimaryBackgroundContainerView()
                        ScrollView {
                            LazyVStack(pinnedViews: [.sectionFooters]) {
                                ForEach(viewModel.filteredTransaction, id:\.reference) { transaction in
                                    TransactionItem(transaction: transaction)
                                        .onTapGesture {
                                            coordinator.showDetails(for: transaction)
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.hasError) {
                ErrorMessageView(errorMessage: $viewModel.errorMessage)
            }
            .padding(.horizontal, 30)
        }
    }
}
