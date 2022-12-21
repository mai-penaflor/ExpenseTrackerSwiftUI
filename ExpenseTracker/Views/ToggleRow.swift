//
//  ToggleRow.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import SwiftUI

struct ToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Toggle("\(title)".uppercased(), isOn: $isOn)
            .font(.caption
                .weight(.bold)
            )
            .foregroundColor(.gray)
        })
    }
}

struct ToggleRow_Previews: PreviewProvider {
    static var previews: some View {
        ToggleRow(title: "Switch", isOn: .constant(true))
    }
}
