//
//  MonthlyBills.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-12-19.
//

import Foundation

class MonthlyBills: Identifiable, ObservableObject {
    var id: Int = 0
    var name: String = ""
    var items = [ExpenseModel]()
}
