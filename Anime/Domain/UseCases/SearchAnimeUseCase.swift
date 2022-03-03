//
//  SearchUseCase.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

class SearchAnimeUseCase: AnyUseCase<String, SearchAnime> {
    
    private let repository: SearchAnimeRepositoryType
    
    public init(repository: SearchAnimeRepositoryType) {
        self.repository = repository
    }
    
    override func execute(params: String) -> AnyPublisher<SearchAnime, Error> {
        return repository.searchAnimes(query: params)
    }
}
