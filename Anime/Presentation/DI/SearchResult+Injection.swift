//
//  SearchResult+Injection.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerSearchResultDependencies(searchText: String) {
        registerSearchResultViewDependencies(searchText: searchText)
    }
    
    static func registerSeachAnimeViewModelDependencies() {
        typealias searchAnimeUseCaseType = AnyUseCase<String, SearchAnime>
        
        register(SearchAnimeUseCase.self) { resolver in
            return SearchAnimeUseCase(repository: resolver.resolve(SearchAnimeRepositoryType.self))
        }.implements(searchAnimeUseCaseType.self)
    }
    
    static func  registerSearchResultViewDependencies(searchText: String) {
        typealias dependencies = SearchResultViewModel.Dependencies
        
        register(SearchResultViewModel.self) { resolver in
            typealias searchAnimeUseCase = SearchAnimeUseCase
            let dependencies = dependencies(searchText: searchText,
                                            searchAnimeUseCase: resolver.resolve(searchAnimeUseCase.self))
            return SearchResultViewModel(dependencies: dependencies)
        }
    }
}
