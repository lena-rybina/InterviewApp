//
//  SearchView.swift
//  InterviewApp
//
// 
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()

    @State var searchQuery = ""

    var body: some View {
        GeometryReader { geo in
            switch viewModel.state {
            case .contentList(let mainTexts):
                VStack {
                    TextFieldWithDebounce(debouncedText: $searchQuery)
                        .onChange(of: searchQuery) { newValue in
                            Task.init {
                                await viewModel.reduce(action: .search(newValue))
                            }
                        }
                        .padding()

                    List(mainTexts,
                         id: \.mainText) { texts in
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(texts.mainText)
                            Text(texts.secondaryText)
                            Spacer()
                        }
                    }
                }
            case .error(let error):
                Text("Error :( - \(error.localizedDescription)")
            case .loading:
                Text("Loading...")
            }
        }
        .onAppear {
            Task.init {
                await viewModel.reduce(action: .search("Fun"))
            }
        }
    }
}

extension String: Identifiable {
    public var id: String {
        self
    }
}
