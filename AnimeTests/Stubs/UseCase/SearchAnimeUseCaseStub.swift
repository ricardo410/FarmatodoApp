//
//  SearchAnimeUseCaseStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

final class SearchAnimeUseCaseStub: AnyUseCase<String, SearchAnime> {
    
    static var response: SearchAnime?
    static var error: Error?
    
    override func execute(params: String) -> AnyPublisher<SearchAnime, Error> {
        
        let publisher = CurrentValueSubject<SearchAnime, Error>(SearchAnimeUseCaseStub.response!)
        
        if let error = SearchAnimeUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
