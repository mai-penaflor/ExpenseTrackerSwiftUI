//
//  Income.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-04.
//

struct IncomeModel: ListItemModel {
    let id: Int
    let name: String
    let amount: Double
    let notes: String?
    let recordToTaxBooks: Bool
}
