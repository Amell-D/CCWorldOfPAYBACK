//
//  PrimaryButton.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import SwiftUI

public struct PrimaryButton: View {
    let text: String
    let buttonAction: () -> Void

    public init(text: String, buttonAction: () -> Void = {}) {
        self.text = text
        self.buttonAction = {}
    }

    public var body: some View {
        Button(action: {
            buttonAction()
        }) {
            Text(text)
                .padding()
                .foregroundColor(.white)
                .font(Font.system(size: 16, weight: .semibold))
                .background {
                    Color.secondaryWB
                        .cornerRadius(8)
                }
        }
    }
}

