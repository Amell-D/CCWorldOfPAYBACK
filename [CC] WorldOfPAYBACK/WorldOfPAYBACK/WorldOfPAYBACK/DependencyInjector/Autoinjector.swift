//
//  Autoinjector.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import NetworkKit
import TransactionsWPM

public protocol Autoinjecting {

    static var shared: Autoinjecting { get }
    static func set(shared: Autoinjecting)

    func start()
    func assemble<T>() -> T
}

public final class Autoinjector: Autoinjecting {

    private static var sharedStorage: Autoinjecting = {
        return Autoinjector(repository: AssemblersRepository())
    }()

    public static var shared: Autoinjecting { return sharedStorage }

    private let repository: AssemblersStoring

    init(repository: AssemblersStoring) {
        self.repository = repository
    }

    public static func set(shared: Autoinjecting) {
        sharedStorage = shared
    }

    public func assemble<T>() -> T {
        let description = String(describing: T.self)
        do {
            let assembler: T = try repository.resolve()
            return assembler
        } catch {
            fatalError("Autoinjector: No entry found for \(description)! Register first!")
        }
    }

    public func start() {
        guard Thread.isMainThread else {
            fatalError("Autoinjector must be called on main thread")
        }
        do {
            try repository.register(NetworkManager() as RequestCalling)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
