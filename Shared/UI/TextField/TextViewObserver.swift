//
//  TextViewObserver.swift
//  InterviewApp
//
//

import Combine
import Foundation

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .seconds(0.5),
                         scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] text in
                self?.debouncedText = text
            } )
            .store(in: &subscriptions)
    }
}

