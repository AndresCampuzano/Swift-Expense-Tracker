//
//  ContentView.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.customBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.customIcon, .primary)
                }
            }
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
