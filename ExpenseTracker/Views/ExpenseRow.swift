//
//  ExpenseRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-05.
//

import SwiftUI

struct ExpenseRow: View {
    let expense: ExpenseModel
    
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var paidText: String = ""
    
    var body: some View {
        HStack(alignment: .center, content: {
            VStack(alignment: .leading) {
                Text(name)
                Text(amount)
                    .foregroundColor(Color(.lightGray))
                    .font(.callout)
            }
            Spacer()
            Text(paidText)
                .foregroundColor(.green)
        })
        .frame(maxWidth: .infinity)
        .onAppear{
            name = expense.name
            amount = String(format: "%.2f", expense.amount)
            paidText = expense.isPaid ? "Paid" : ""
        }
    }
}

struct ExpenseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRow(expense: ExpenseModel(name: "Globe Broadband", amount: 10.0, isPaid: true))
    }
}
