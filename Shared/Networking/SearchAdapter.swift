//
//  SearchAdapter.swift
// InterviewApp
//
//
//

import Foundation

class SearchAdapter {
    static func search(_ query: String) async throws -> PredictionsContainer {
//        let limitQuery: URLQueryItem = .init(name: "limit",
//                                             value: "\(25)")
//        let currentOffsetQuery: URLQueryItem = .init(name: "offset",
//                                                     value: "\(0)")
        let searchQuery: URLQueryItem = .init(name: "input",
                                              value: query)
        let apiKeyQuery: URLQueryItem = .init(name: "key",
                                              value: "AIzaSyC3s4DuNYs_SccOm3ZvXlozsMeQzuiMbHo")

        return try await Networking.shared
            .request(with: .init(path: "maps/api/place/autocomplete/json",
                                 queryItems: [searchQuery,
                                              apiKeyQuery]))
            .map(to: PredictionsContainer.self)
    }
}

//struct SearchResponse: Codable {
//    let data: [Prediction]
//}
