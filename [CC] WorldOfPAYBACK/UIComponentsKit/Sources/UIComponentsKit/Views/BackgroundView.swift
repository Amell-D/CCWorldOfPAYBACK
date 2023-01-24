//
//  BackgroundView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

public struct BackgroundView: View {

    public init () { }

    public var body: some View {
        Image.background
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .blur(radius: 32)
    }
}
