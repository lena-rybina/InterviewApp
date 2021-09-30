//
//  NetworkingManager.swift
//  InterviewApp
//
//
//

import Foundation

enum APIError: Error {
    case `default`
}

class Networking {
    static let shared = Networking()

    /// Makes asynchronous networking request with provided configuration
    func request(with config: RequestConfig) async throws -> Data {
        let request = configureURLRequest(with: config)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.default }
        return data
    }

    /// Configures networking request based on provided configuration
    private func configureURLRequest(with config: RequestConfig) -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = config.base

        var pathItems: [String] = []
        pathItems.append(config.path)
        components.queryItems = config.queryItems

        let cleanedPath = pathItems
            .filter { !$0.isEmpty }
            .joined(separator: "/")

        components.path = "/\(cleanedPath)"

        var request = URLRequest(url: components.url!)
        request.httpMethod = config.type.rawValue

        return request
    }
}

enum RequestType: String {
    case get = "GET"
}

struct RequestConfig {
    var path: String
    var queryItems: [URLQueryItem]?
    var base: String = "maps.googleapis.com"
    var type: RequestType = .get
}
