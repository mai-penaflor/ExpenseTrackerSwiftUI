//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-12-01.
//

import Foundation

struct Expenses: Codable {
    let items: [ExpenseModel]
 
    init(expenses: [ExpenseModel]) {
        self.items = expenses
    }

    enum CodingKeys: String, CodingKey {
        case items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([ExpenseModel].self, forKey: .items)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
    }
}
