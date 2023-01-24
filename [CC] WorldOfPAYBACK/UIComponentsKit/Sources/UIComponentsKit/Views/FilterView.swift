//
//  FilterView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

public struct FilterView<Content: View>: View {

    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Menu {
            content
        } label: {
            Image(systemName: "line.horizontal.3.decrease.circle.fill")
                .resizable()
                .frame(width: 45, height: 45)
                .accentColor(.secondaryWB)
        }
        .padding(.leading)
        .padding(.bottom, 10)
    }
}
