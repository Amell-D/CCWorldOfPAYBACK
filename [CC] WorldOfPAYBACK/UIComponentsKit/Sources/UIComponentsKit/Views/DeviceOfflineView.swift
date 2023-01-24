//
//  DeviceOfflineView.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import SwiftUI

public struct DeviceOfflineView: View {

    @Binding public var isLoading: Bool

    public init(isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }

    public var body: some View {
        VStack(spacing: 20) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
            if !isLoading {
                Text("It looks like you're not connected to the internet!")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red.cornerRadius(16))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(PrimaryBackgroundContainerView())
    }
}
