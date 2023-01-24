//
//  AssemblersRepository.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation

public protocol AssemblersStoring {
    func register<T>(_ assembler: T) throws
    func resolve<T>() throws -> T
}

public enum AssemblersRepositoryErrors: Error {
    case duplicateEntry
    case noEntry
}

final class AssemblersRepository: AssemblersStoring {

    private var assemblers = [String: AnyObject]()

    public func register<T>(_ assembler: T) throws {
        let key = String(describing: T.self)
        if assemblers.keys.contains(key) {
            throw AssemblersRepositoryErrors.duplicateEntry
        }
        self.assemblers[key] = assembler as AnyObject
    }

    public func resolve<T>() throws -> T {
        let description = String(describing: T.self)
        let assembler = assemblers[description] as? T
        guard assembler != nil else {
            throw AssemblersRepositoryErrors.noEntry
        }
        return assembler!
    }
}
