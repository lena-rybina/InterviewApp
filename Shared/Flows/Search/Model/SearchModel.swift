//
//  SearchModel.swift
//  InterviewApp
//
// 
//

import Foundation

struct SearchModel {
    /// Triggers async networking request and maps response to a list of GIF URLs with an original size
    func search(query: String) async throws -> [StructuredFormatting] {
        try await SearchAdapter
            .search(query)
            .predictions
            .map(\.structuredFormatting)
    }
}
