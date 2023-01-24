//
//  File.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import UIKit

public enum NavigationBarAppearance {

    case lightMode

    public var select: UINavigationBarAppearance {
        switch self {
            case .lightMode: return setupLightModeNavigationBar()
        }
    }

    private func setupLightModeNavigationBar() -> UINavigationBarAppearance {
        let customNavBarAppearance = UINavigationBarAppearance()

        customNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        return customNavBarAppearance
    }
}
