//
//  TopAnimeRepositoryStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Combine
@testable import Anime

final class TopAnimeRepositoryStub {
    static var response: TopAnimeMain?
    static var error: Error?
}

extension TopAnimeRepositoryStub: TopAnimeRepositoryType {
    
    func getTopAnimes() -> AnyPublisher<TopAnimeMain, Error> {
        let response = TopAnimeRepositoryStub.response ?? TestsConstants.TopAnimeConstant.topAnimeMain
        
        let subject = CurrentValueSubject<TopAnimeMain, Error>(response)
        
        if let error = TopAnimeRepositoryStub.error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
}
