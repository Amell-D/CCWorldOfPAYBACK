//
//  ErrorMessageView.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 11/13/22.
//

import SwiftUI

public struct ErrorMessageView: View {

    @Binding var errorMessage: String

    public init(errorMessage: Binding<String>) {
        self._errorMessage = errorMessage
    }

    public var body: some View {
        Text(errorMessage)
            .foregroundColor(.red)
            .font(.headline)
            .multilineTextAlignment(.center)
    }
}
