//
//  PaymentFrequency.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-10-04.
//

enum PaymentFrequency: Int, CaseIterable {
    case weekly = 0
    case semiMonthly
    case monthly
    case quarterly
    case yearly
    
    var displayValue: String {
        switch self {
        case .weekly:
                return "Weekly"
        case .semiMonthly:
            return "Semi-monthly"
        case .monthly:
            return "Monthly"
        case .quarterly:
            return "Quarterly"
        case .yearly:
            return "Yearly"
        }
    }
}
