//
//  CoordinatorProtocol.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import UIKit

public protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
}
