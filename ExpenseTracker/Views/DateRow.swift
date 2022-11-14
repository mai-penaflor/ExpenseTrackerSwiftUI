//
//  DateRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import SwiftUI

struct DateRow: View {
    let title: String
    @State var leftPadding: CGFloat = 0
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            DatePicker("\(title)".uppercased(), selection: $date, displayedComponents: [.date])
                .font(.caption
                    .weight(.bold)
                )
                .foregroundColor(.gray)
        })
        .padding(.leading, leftPadding)
    }
}

struct DateRow_Previews: PreviewProvider {
    static var previews: some View {
        DateRow(title: "Date Paid", date: Date())
    }
}
