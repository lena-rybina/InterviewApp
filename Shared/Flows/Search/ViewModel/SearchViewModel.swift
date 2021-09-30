//
//  SearchViewModel.swift
//  InterviewApp
//
// 
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published private(set) var state: SearchState = .loading

    let model = SearchModel()

    /// Receives View action and reduces to a new state
    func reduce(action: SearchActions) async {
        switch action {
        case .search(let query):
            do {
                let mainText = try await model.search(query: query)
                DispatchQueue.main.async {
                    self.state = .contentList(mainText) // Publishing changes only allowed from the main thread
                }
            } catch {
                state = .error(error)
            }
        }
    }
}

enum SearchActions {
    case search(String)
}

enum SearchState {
    case loading
    case error(Error)
    case contentList([StructuredFormatting])
}
