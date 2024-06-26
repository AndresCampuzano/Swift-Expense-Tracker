//
//  TransactionRow.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var data: Transaction
    var showChevron: Bool = false // enabled in preview
    
    var body: some View {
        HStack() {
            // MARK: Transaction Amount
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.customIcon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: data.icon), fontsize: 24, color: Color.customIcon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction Merchant
                Text(data.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(data.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
                Text(data.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding([.leading], 8)
            
            Spacer()
            
            // MARK: Transaction Amount
            Text(data.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundStyle(data.type == TransactionType.credit.rawValue ? Color.customText : .primary)
            
            // MARK: Chevron Forward
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            
        }
        .padding([.top, .bottom], 8)
    }
}

#Preview {
    TransactionRow(data: transactionPreviewData, showChevron: true)
}
