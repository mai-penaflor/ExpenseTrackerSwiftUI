//
//  PickerRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import SwiftUI

struct PickerRow: View {
    let title: String
    @State var selections: [String]
    @State var selectedValue = ""
    @State var selectedIdx = 0
    
    init(title: String, selections: [String], selectedValue: String = "monthly") {
        self.title = title
        self.selections = selections
        self.selectedValue = "quarterly"
        self.selectedIdx = selections.firstIndex(of: selectedValue) ?? 0
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Picker("\(title)".uppercased(), selection: $selectedIdx) {
                ForEach(selections, id: \.self) {
                    Text($0.capitalized).tag(selectedIdx)
                }
            }
            .onChange(of: selectedValue) {
                selectedValue = $0
            }
            .pickerStyle(.automatic)
            .font(.caption
                .weight(.bold)
            )
            .foregroundColor(.gray)
        })
    }
}

struct PickerRow_Previews: PreviewProvider {
    static var previews: some View {
        PickerRow(title: "Pick", selections: ["Monthly", "Quarterly"], selectedValue: "Monthly")
    }
}
