//
//  ListItemModel.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-04.
//

protocol ListItemModel: Identifiable {
    var id: Int { get }
    var name: String { get }
    var amount: Double { get }
    var recordToTaxBooks: Bool { get }
    var notes: String? { get }
}
