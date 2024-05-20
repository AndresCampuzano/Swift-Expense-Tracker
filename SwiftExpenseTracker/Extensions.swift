//
//  Extensions.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import Foundation
import SwiftUI

extension Color {
    static let customBackground = Color("Background")
    static let customIcon = Color("Icon")
    static let customText = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            // Return the Unix epoch date (January 1, 1970) if parsing fails
            return Date(timeIntervalSince1970: 0)
        }
        
        return parsedDate
    }
}
