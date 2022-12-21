//
//  Binding+Utilities.swift
//  ExpenseTracker
//
//  Created by Mai Peñaflor on 2022-12-18.
//

import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
