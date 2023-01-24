//
//  CategoryWP.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation

public enum CategoryWP: CaseIterable {
    case one
    case two
    case three

    var number: Int {
        switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
        }
    }
}
