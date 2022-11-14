//
//  ExpenseDetailView.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-06.
//

import SwiftUI

struct ExpenseDetailView: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.sections) { section in
            Section(header: Text("\(section.title)")) {
                ForEach(section.rowModels) { row in
                    if row.dataType == .text {
                        TextfieldRow(title: row.title, text: row.text ?? "")
                    } else if row.dataType == .boolean {
                        ToggleRow(title: row.title, isOn: row.isOn)
                    } else if row.dataType == .date {
                        DateRow(title: row.title, date: row.date ?? Date())
                    } else if row.dataType == .picker {
                        if let selections = row.selections {
                            PickerRow(title: row.title, selections: selections, selectedValue: row.selectedValue ?? selections.last!)
                        }
                    }
                }
            }
            .listRowBackground(Color.white)
            .listRowSeparator(.hidden)
        }
        .navigationTitle("").navigationBarTitleDisplayMode(.inline)
        .listStyle(.grouped)
        .onAppear {
            let tableHeaderView = UIView(frame: .zero)
            tableHeaderView.frame.size.height = 1
            UITableView.appearance().tableHeaderView = tableHeaderView
        }
    }
}

extension ExpenseDetailView {
    class ViewModel: ObservableObject {
        let expense: ExpenseModel?
        var sections = [ListSection]()
        init(expense: ExpenseModel? = nil) {
            self.expense = expense
            createRows()
        }
        
        func createRows() {
            let isEditable = expense == nil
            var rowModels = [ListRowModel]()
            rowModels.append(ListRowModel(id: 0, title: "Name", text: expense?.name, dataType: .text))
            rowModels.append(ListRowModel(id: 1, title: "Amount", text: "\(expense?.amount ?? 0)", dataType: .text))
            rowModels.append(ListRowModel(id: 2, title: "Frequency", selections: PaymentFrequency.allCases.map{ $0.rawValue }, selectedValue: expense?.frequency.rawValue ?? PaymentFrequency.monthly.rawValue, dataType: .picker))
            rowModels.append(ListRowModel(id: 3, title: "Record to Tax Books", isOn: expense?.recordToTaxBooks ?? false, dataType: .boolean))
            sections.append(ListSection(id: 0, title: "Expense Details", rowModels: rowModels))
            
            // Reset `rowModels`
            rowModels.removeAll()
            
            let isPaid = expense?.isPaid ?? false
            rowModels.append(ListRowModel(id: 4, title: "Paid", isOn: isPaid, dataType: .boolean))
            if isPaid {
                rowModels.append(ListRowModel(id: 5, title: "Date Paid", date: expense?.datePaid, dataType: .date))
                rowModels.append(ListRowModel(id: 6, title: "Reference Code", text: expense?.referenceCode, dataType: .text))
                rowModels.append(ListRowModel(id: 7, title: "Mode of Payment", text: expense?.modeOfPayment, dataType: .text))
            }
            sections.append(ListSection(id: 1, title: "Payment Details", rowModels: rowModels))
        }
    }
}

struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView()
    }
}

struct ListSection: Identifiable {
    let id: Int
    let title: String
    let rowModels: [ListRowModel]
}
