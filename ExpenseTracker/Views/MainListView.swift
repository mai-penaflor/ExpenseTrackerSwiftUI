//
//  MainListView.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 7/19/22.
//

import SwiftUI

struct MainListView: View {
    @State private var showNew = false
    
    private let fileSystemService = AppleFileSystemService.shared
    private let expensesFileName = "expenses.json"
    
    @State private var sections = [MonthlyBills]()
    @State private var items = [ExpenseModel]()
    
    var body: some View {
        NavigationView {
            List(sections) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        let expenseView = ExpenseDetailView(expense: item)
                        NavigationLink(destination: expenseView) {
                            ExpenseRow(expense: item)
                        }
                    }
                }
            }
            .navigationTitle("Monthly Dues")
            .background(
                    NavigationLink(destination: ExpenseDetailView(expense: ExpenseModel()), isActive: $showNew) {
                      EmptyView()
                    }
                )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: ExpenseDetailView(expense: ExpenseModel()))
                    Button {
                        showNew = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
        .onAppear(perform: {
            getItems()
        })
        .onReceive(NotificationCenter.default.publisher(for: NotificationManager.didSaveExpense)) { notification in
           guard let expense = notification.object as? ExpenseModel else { return }
            saveExpense(expense)
        }
    }
    
    private func didSaveExpense(_ notification: Notification) {
        guard let expense = notification.object as? ExpenseModel else { return }
        saveExpense(expense)
    }
}

extension MainListView {
    
    func getItems() {
        retrieveExpenses()
    }
    
    func retrieveExpenses() {
        do {
            let filePath = fileSystemService.documentsDirectory.appendingPathComponent(expensesFileName)
            if let retrievedData = try fileSystemService.retrieve(from: filePath) {
                let expenses = try JSONDecoder().decode(Expenses.self, from: retrievedData)
                let items = expenses.items.filter {
                    return Calendar.current.component(.month, from: $0.datePaid ?? Date()) == 1
                }
                let dec = MonthlyBills()
                dec.name = "December"
                dec.items = items
                sections = [dec] //TODO: Create dynamically
            }
        } catch let error {
            print("Error while retrieving data: \(error.localizedDescription)")
        }
    }
    
    func saveExpenses() {
        do {
            let data = try JSONEncoder().encode(Expenses(expenses: items))
            let filePath = fileSystemService.documentsDirectory.appendingPathComponent(expensesFileName)
            try fileSystemService.save(data: data, to: filePath)
        } catch let error {
            print("Error while saving data: \(error.localizedDescription)")
        }
    }
    
    func saveExpense(_ expense: ExpenseModel) {
        items.removeAll(where: { $0.id == expense.id })
        items.append(expense)
        
        let dec = MonthlyBills()
        dec.name = "December"
        dec.items = items
        sections = [dec] //TODO: Create dynamically
        
        saveExpenses()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
