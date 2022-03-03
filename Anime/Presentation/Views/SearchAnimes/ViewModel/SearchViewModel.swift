//
//  SearchViewModel.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine
import SwiftUI
import Resolver

class SearchAnimeViewModel: BaseViewModel {
    
    @Published var state = SearchAnimeState()
    override init() {
        super.init()
        self.state.searchText = CoreConstants.Values.empty
    }
}

extension SearchAnimeViewModel: SearchAnimeViewModelType {
    
    func goTosearchResultView(searchText: String) -> AnyView {
        Resolver.registerSearchResultDependencies(searchText: searchText )
        return AnyView(SearchResultView(viewModel: Resolver.resolve(SearchResultViewModel.self)))
    }
    
}
