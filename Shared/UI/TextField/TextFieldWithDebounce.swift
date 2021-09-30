//
//  TextField+Debounce.swift
//  InterviewApp
//
//

import SwiftUI

struct TextFieldWithDebounce : View {
    @Binding var debouncedText : String
    @StateObject private var textObserver = TextFieldObserver()

    var body: some View {
        VStack {
            TextField("1600 Amphitheatre",
                      text: $textObserver.searchText)
                .frame(height: 30)
                .padding(.leading, 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.blue, lineWidth: 1)
                )
                .padding(.horizontal, 20)
        }.onReceive(textObserver.$debouncedText) { text in
            debouncedText = text
        }
    }
}
