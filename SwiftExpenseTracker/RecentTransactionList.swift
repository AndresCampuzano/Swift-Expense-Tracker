//
//  RecentTransactionList.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionsListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // MARK: Header Link
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.customText)
                }
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            if transactionsListVM.isLoading {
                ProgressView()
                    .padding()
            } else {
                ForEach(Array(transactionsListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                    NavigationLink(destination: TransactionDetail(data: transaction)) {
                        TransactionRow(data: transaction, showChevron: true)
                            .foregroundStyle(Color(.label))
                    }
                    
                    if index < transactionsListVM.transactions.prefix(5).count - 1 {
                        Divider()
                    }
                }
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5 )
    }
}

#Preview {
    let transactionsListVM: TransactionListViewModel = {
        let transactionsListVM = TransactionListViewModel()
        transactionsListVM.transactions = transactionListPreviewData
        return transactionsListVM
    }()
    
    return RecentTransactionList()
        .environmentObject(transactionsListVM)
}
