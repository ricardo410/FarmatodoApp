//
//  SearchAnimeRepositoryStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Combine
@testable import Anime

final class SearchAnimeRepositoryStub {
    static var response: SearchAnime?
    static var error: Error?
}

extension SearchAnimeRepositoryStub: SearchAnimeRepositoryType {
    func searchAnimes(query: String) -> AnyPublisher<SearchAnime, Error> {
        
        let response = SearchAnimeRepositoryStub.response ?? TestsConstants.SearchAnimeConstants.searchAnime
        
        let subject = CurrentValueSubject<SearchAnime, Error>(response)
        
        if let error = SearchAnimeRepositoryStub.error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
}
