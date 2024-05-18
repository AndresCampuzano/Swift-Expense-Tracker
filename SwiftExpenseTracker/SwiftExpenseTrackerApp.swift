//
//  SwiftExpenseTrackerApp.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import SwiftUI

@main
struct SwiftExpenseTrackerApp: App {
    @StateObject var transactionsListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionsListVM)
        }
    }
}
