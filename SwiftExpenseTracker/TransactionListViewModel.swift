//
//  TransactionListViewModel.swift
//  SwiftExpenseTracker
//
//  Created by Andres C G on 5/18/24.
//

import Foundation
import Combine
import Collections

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchSerialQueue.main) // Changed from DispathQueue to DispatchSerialQueue
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions ", error.localizedDescription)
                case .finished:
                    print("Finished fecthing transactions")
                }
                
                self?.isLoading = false
                
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)

    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {
            return [:]
        }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func refreshTransactions() {
        getTransactions()
    }
}
