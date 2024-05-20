//
//  TransactionDetail.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/20/24.
//

import SwiftUI

struct TransactionDetail: View {
    var data: Transaction
    var body: some View {
        TransactionRow(data: data)
            .padding()
    }
}

#Preview {
    TransactionDetail(data: transactionPreviewData)
}
