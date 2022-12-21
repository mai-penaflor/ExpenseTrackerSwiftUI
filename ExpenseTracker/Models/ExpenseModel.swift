//
//  ExpenseModel.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-04.
//

import Foundation
import SwiftUI

class ExpenseModel: ListItemModel, ObservableObject, Codable {
    @Published var id: Int = 0
    @Published var name = ""
    @Published var amount: Double = 0
    @Published var isPaid: Bool = false
    @Published var datePaid: Date?
    @Published var dueDate: Date?
    @Published var reminderDate: Date?
    @Published var modeOfPayment: String = ""
    @Published var referenceCode: String = ""
    @Published var notes: String?
    @Published var isRecurring: Bool
    @Published var frequencyId: Int = 2
    @Published var recordToTaxBooks: Bool
    
    init(id: Int = 0, name: String = "", amount: Double = 0, isPaid: Bool = false, datePaid: Date? = nil, dueDate: Date? = nil, reminderDate: Date? = nil, notes: String? = nil, isRecurring: Bool = false, recordToTaxBooks: Bool = false) {
        self.id = id
        self.name = name
        self.amount = amount
        self.isPaid = isPaid
        self.datePaid = datePaid
        self.dueDate = dueDate
        self.reminderDate = reminderDate
        self.notes = notes
        self.isRecurring = isRecurring
        self.recordToTaxBooks = recordToTaxBooks
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case amount
        case isPaid
        case datePaid
        case dueDate
        case reminderDate
        case modeOfPayment
        case referenceCode
        case notes
        case isRecurring
        case frequencyId
        case recordToTaxBooks
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        amount = try container.decode(Double.self, forKey: .amount)
        isPaid = try container.decode(Bool.self, forKey: .isPaid)
        datePaid = try container.decode(Date.self, forKey: .datePaid)
        dueDate = try container.decode(Date.self, forKey: .dueDate)
        reminderDate = try container.decode(Date.self, forKey: .reminderDate)
        modeOfPayment = try container.decode(String.self, forKey: .modeOfPayment)
        referenceCode = try container.decode(String.self, forKey: .referenceCode)
        notes = try container.decode(String.self, forKey: .notes)
        isRecurring = try container.decode(Bool.self, forKey: .isRecurring)
        frequencyId = try container.decode(Int.self, forKey: .frequencyId)
        recordToTaxBooks = try container.decode(Bool.self, forKey: .recordToTaxBooks)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(amount, forKey: .amount)
        try container.encode(isPaid, forKey: .isPaid)
        try container.encode(datePaid, forKey: .datePaid)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(reminderDate, forKey: .reminderDate)
        try container.encode(modeOfPayment, forKey: .modeOfPayment)
        try container.encode(referenceCode, forKey: .referenceCode)
        try container.encode(notes, forKey: .notes)
        try container.encode(isRecurring, forKey: .isRecurring)
        try container.encode(frequencyId, forKey: .frequencyId)
        try container.encode(recordToTaxBooks, forKey: .recordToTaxBooks)
    }
}
