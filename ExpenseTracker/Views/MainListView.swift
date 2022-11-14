//
//  MainListView.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 7/19/22.
//

import SwiftUI

struct MainListView: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.sections) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        let expenseViewModel = ExpenseDetailView.ViewModel(expense: item)
                        let expenseView = ExpenseDetailView(viewModel: expenseViewModel)
                        NavigationLink(destination: expenseView) {
                            ExpenseRow(expense: item)
                        }
                    }
                }
            }
            .navigationTitle("Monthly Dues")
        }
        .onAppear(perform: {
            viewModel.getItems()
        })
    }
}

extension MainListView {
    class ViewModel: ObservableObject {
        @Published var sections = [MonthlyBills]()
        @Published var items = [ExpenseModel]()
        func getItems() {
            items = [ExpenseModel(id: 0, name: "test", amount: 23.00, isPaid: true, datePaid: nil, dueDate: nil, reminderDate: nil, modeOfPayment: nil, referenceCode: "dasd", notes: "asd", frequency: .monthly, recordToTaxBooks: true)]
            sections = [MonthlyBills(id: 0, name: "October", items: items), MonthlyBills(id: 1, name: "September", items: items), MonthlyBills(id: 2, name: "August", items: items)]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}

struct MonthlyBills: Identifiable {
    let id: Int
    let name: String
    let items: [ExpenseModel]
}
