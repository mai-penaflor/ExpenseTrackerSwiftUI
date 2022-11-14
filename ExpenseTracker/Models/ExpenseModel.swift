//
//  ExpenseModel.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-04.
//

import Foundation

struct ExpenseModel: ListItemModel {
    let id: Int
    let name: String
    let amount: Double
    let isPaid: Bool
    let datePaid: Date?
    let dueDate: Date?
    let reminderDate: Date?
    let modeOfPayment: String?
    let referenceCode: String?
    let notes: String?
    let frequency: PaymentFrequency
    let recordToTaxBooks: Bool
}
