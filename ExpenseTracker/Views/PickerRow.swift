//
//  PickerRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import SwiftUI

struct PickerRow: View {
    let title: String
    let selections: [String]
    @Binding var selectedIndex: Int
    
    @State private var selectedValue: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Picker("\(title)".uppercased(), selection: $selectedValue) {
                ForEach(selections, id: \.self) {
                    Text($0)
                }
            }
            .onChange(of: selectedValue) { _ in
                selectedIndex = selections.firstIndex(of: selectedValue) ?? 0
            }
            .pickerStyle(.automatic)
            .font(.caption
                .weight(.bold)
            )
            .foregroundColor(.gray)
        })
        .onAppear {
            selectedValue = selections[selectedIndex]
        }
    }
}

struct PickerRow_Previews: PreviewProvider {
    static var previews: some View {
        PickerRow(title: "Pick", selections: ["Monthly", "Quarterly"], selectedIndex: .constant(0))
    }
}
