//
//  ContentView.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    // This is just for the refresh trigger
    @EnvironmentObject var transactionsListVM: TransactionListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack( spacing: 24) {
                    // MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
            }
            .background(Color.customBackground)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.customIcon, .primary)
                }
            }
            .navigationTitle("Overview")
        }
        .refreshable {
            // REFRESH
            transactionsListVM.refreshTransactions()
        }
    }
}

#Preview {
    let transactionsListVM: TransactionListViewModel = {
        let transactionsListVM = TransactionListViewModel()
        transactionsListVM.transactions = transactionListPreviewData
        return transactionsListVM
    }()
    
    return ContentView()
        .environmentObject(transactionsListVM)
}
