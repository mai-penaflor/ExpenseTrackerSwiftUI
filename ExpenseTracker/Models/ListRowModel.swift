//
//  ListRowModel.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-11-14.
//

import Foundation
import SwiftUI

enum DataType: Int {
    case text = 0
    case boolean
    case date
    case picker
}

struct ListRowModel: Identifiable {
    let id: Int
    let title: String
    @State var text: String = ""
    @State var isOn: Bool = false
    @State var date: Date? = nil
    var selections: [String]?
    var selectedValue: String?
    let isEditable = false
    let dataType: DataType

    var value: Any? {
        switch dataType {
        case .text:
            return title
        case .boolean:
            return isOn
        case .date:
            return date
        case .picker:
            return selectedValue
        }
    }
}
