//
//  NetworkError.swift
//  NetworkManager
//
//  Created by Amel Dizdarevic on 12/14/22.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case badURL
    case apiError(code: Int)
    case invalidJSON
    case serverError(code: Int)
    case unableToParseData
    case thrownError(error: String)

    public var description: String {
        switch self {
            case .badURL: return "ERROR: Invalid url!"
            case .apiError(let code): return "ERROR: API failed with code \(code)"
            case .invalidJSON: return "ERROR: Invalid json file!"
            case .serverError(let code): return "ERROR: Server failed with code:\(code)"
            case .unableToParseData: return "ERROR: Unable to parse data!"
            case .thrownError(let error): return "ERROR: \(error)"
        }
    }
}
