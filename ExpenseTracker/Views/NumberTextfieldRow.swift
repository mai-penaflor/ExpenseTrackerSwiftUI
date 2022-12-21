//
//  NumberTextfieldRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-12-18.
//

import SwiftUI

struct NumberTextfieldRow: View {
    let title: String
    @Binding var value: Double
    
    @State private var text = ""
    
    var body: some View {
        VStack() {
            HStack(alignment: .center, spacing: 15, content: {
                Text("\(title)".uppercased())
                    .font(.caption
                        .weight(.bold)
                    )
                    .foregroundColor(.gray)
                TextField("", text: $text, onEditingChanged: { (changed) in
                    value = Double(text) ?? 0
                })
                .padding(.leading, 12.0)
                .padding(.trailing, 12.0)
                .font(.body)
                .foregroundColor(.black)
                .frame(height: 35)
                .textFieldStyle(.plain)
                .tint(.black)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary.opacity(0.1), lineWidth: 0.5)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.init(white: 0.97))
                        )
                )
                .keyboardType(.decimalPad)
            })
        }
        .onAppear{
            text = value > 0.0 ? String(value) : ""
        }
    }
}

struct NumberTextfieldRow_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextfieldRow(title: "Title", value: .constant(0))
    }
}
