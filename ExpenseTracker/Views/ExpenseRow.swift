//
//  ExpenseRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-05.
//

import SwiftUI

struct ExpenseRow: View {
    let expense: ExpenseModel
    var body: some View {
        Text(expense.name)
    }
}

struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        let testExpense = ExpenseModel(id: 0, name: "tesft", amount: 23.00, isPaid: true, datePaid: nil, dueDate: nil, reminderDate: nil, modeOfPayment: nil, referenceCode: "dasd", notes: "asd", frequency: .monthly, recordToTaxBooks: true)
        ExpenseRow(expense: testExpense)
    }
}
