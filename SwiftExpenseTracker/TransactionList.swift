//
//  TransactionList.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/19/24.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                // MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key ) { month, transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) { transaction in
                            NavigationLink(destination: TransactionDetail(data: transaction)) {
                                TransactionRow(data: transaction)
                            }
                        }
                    } header: {
                        // MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("Transactions")
    }
}

#Preview {
    let transactionsListVM: TransactionListViewModel = {
        let transactionsListVM = TransactionListViewModel()
        transactionsListVM.transactions = transactionListPreviewData
        return transactionsListVM
    }()
    
    return NavigationStack {
        TransactionList()
            .environmentObject(transactionsListVM)
    }
}
