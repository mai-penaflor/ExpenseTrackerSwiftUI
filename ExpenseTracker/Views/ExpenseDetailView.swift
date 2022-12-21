//
//  ExpenseDetailView.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-06.
//

import SwiftUI

extension Date {
    static var currentTimeStamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}

struct ExpenseDetailView: View {
    @StateObject var expense: ExpenseModel
    
    @Environment(\.presentationMode) var presentationMode
    
    init(expense: ExpenseModel = .init()) {
        _expense = StateObject(wrappedValue: expense)
    }
        
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                Section(header: Text("Expense details")) {
                    TextfieldRow(title: "Title", text: $expense.name)
                    NumberTextfieldRow(title: "Amount", value: $expense.amount)
                    ToggleRow(title: "Recurring", isOn: $expense.isRecurring)
                    if expense.isRecurring {
                        PickerRow(title: "Frequency", selections: PaymentFrequency.allCases.map{ $0.displayValue }, selectedIndex: $expense.frequencyId)
                    }
                    ToggleRow(title: "Record To Tax Books", isOn: $expense.recordToTaxBooks)
                }
                .listRowBackground(Color.white)
                .listRowSeparator(.hidden)
                Section(header: Text("Payment Details")) {
                    ToggleRow(title: "Paid", isOn: $expense.isPaid)
                    if expense.isPaid {
                        DateRow(title: "Date Paid", date: $expense.datePaid)
                        TextfieldRow(title: "Reference Code", text: $expense.referenceCode)
                        TextfieldRow(title: "Mode of Payment", text: $expense.modeOfPayment)
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
            Spacer()
            HStack(alignment: .center, spacing: 0, content: { Button(action: {
                NotificationCenter.default.post(name: NotificationManager.didSaveExpense,
                                                    object: expense,
                                                    userInfo: nil)
                presentationMode.wrappedValue.dismiss()
            }) {
                    Text("Save")
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                    )
                }
                .background(Color.green)
                .cornerRadius(25)
                .frame(maxWidth: .infinity)
            })
            
            Spacer()
        }
        .padding(0)
    }
}

struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView(expense: ExpenseModel())
    }
}
