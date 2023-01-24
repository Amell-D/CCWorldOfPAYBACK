//
//  PrimaryBackgroundContainerView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

public struct PrimaryBackgroundContainerView: View {

    public init() { }

    public var body: some View {
        ZStack {
            BackgroundView()
            Color.secondaryWB
                .ignoresSafeArea()
                .opacity(0.5)
        }
    }
}
