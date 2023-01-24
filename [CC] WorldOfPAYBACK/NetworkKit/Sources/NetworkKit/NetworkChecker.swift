//
//  NetworkChecker.swift
//  NetworkManager
//
//  Created by Amel Dizdarevic on 1/22/23.
//

import Foundation
import Network

public final class NetworkChecker: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkChecker")
    @Published public var isConnected = true

    public init() {
        startMonitoring()
    }

    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }

        monitor.start(queue: queue)
    }
}
