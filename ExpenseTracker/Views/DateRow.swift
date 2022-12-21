//
//  DateRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import SwiftUI

struct DateRow: View {
    let title: String
    @Binding var date: Date?
    
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            DatePicker("\(title)".uppercased(), selection: $selectedDate, displayedComponents: [.date])
                .font(.caption
                    .weight(.bold)
                )
                .foregroundColor(.gray)
                .onChange(of: date, perform: { value in
                    date = value
               })
        })
        .padding(.leading, 0)
        .onAppear{
            selectedDate = date ?? Date()
        }
    }
}

struct DateRow_Previews: PreviewProvider {
    static var previews: some View {
        DateRow(title: "Date", date: .constant(Date()))
    }
}
