//
//  TextfieldRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-06.
//

import SwiftUI

struct TextfieldRow: View {
    let title: String
    @State var text: String = ""
    
    var body: some View {
        VStack() {
            HStack(alignment: .center, spacing: 15, content: {
                Text("\(title)".uppercased())
                    .font(.caption
                        .weight(.bold)
                    )
                    .foregroundColor(.gray)
                TextField(
                    "",
                    text: $text,
                    onCommit: {
                        //code here
                    }
                )
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
            })
        }
    }
}

struct TextfieldRow_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldRow(title: "", text: "")
    }
}
