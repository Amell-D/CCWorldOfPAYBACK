//
//  NavigationRouter.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

public protocol NavigationRouter {

    associatedtype V: View

    var transition: NavigationTranisitionStyle { get }

    @ViewBuilder
    func view() -> V
}
