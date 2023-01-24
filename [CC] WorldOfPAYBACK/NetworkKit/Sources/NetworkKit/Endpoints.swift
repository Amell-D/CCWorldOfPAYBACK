import Foundation

public enum Endpoints {
    case getTransactions
    case getMockData(fileName: String)
}

public final class Endpoint {
    public var endpoint: Endpoints
    public var configuration: Configuration

    public init(endpoint: Endpoints, configuration: Configuration) {
        self.endpoint = endpoint
        self.configuration = configuration
    }

    var httpMethod: HTTPMethod {
        switch endpoint {
            case .getTransactions, .getMockData: return .GET
        }
    }

    private var endpointUrl: String {
        switch endpoint {
            case .getTransactions:
                return "transactions"
            case .getMockData(let fileName):
                return Bundle.module.path(forResource: fileName, ofType: "json") ?? ""
        }
    }

    var getURLString: String {
        switch source {
            case .remote: return configuration.baseUrl + endpointUrl
            case .local: return "file://\(endpointUrl)"
        }
    }

    var source: DataSource {
        switch endpoint {
            case .getMockData: return .local
            default: return .remote
        }
    }
}

public enum DataSource {
    case remote
    case local
}

public enum Configuration {
    case production
    case stage
    case test

    var baseUrl: String {
        switch self {
            case .production: return "https://api.payback.com/"
            case .stage: return "https://api-test.payback.com/"
            case .test: return ""
        }
    }
}
