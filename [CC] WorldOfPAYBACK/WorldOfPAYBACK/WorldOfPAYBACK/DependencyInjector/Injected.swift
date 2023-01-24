//
//  Injected.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation

@propertyWrapper struct Injected<T> {

    var wrappedValue: T

    init() {
        self.wrappedValue = Autoinjector.shared.assemble()
    }
}

