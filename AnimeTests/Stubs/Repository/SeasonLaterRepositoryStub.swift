//
//  SeasonLaterRepositoryStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Combine
@testable import Anime

final class SeasonLaterRepositoryStub {
    static var response: SeasonLater?
    static var error: Error?
}

extension SeasonLaterRepositoryStub:  SeasonLaterRepositoryType {
    func getSeasonLater() -> AnyPublisher<SeasonLater, Error> {
        let response = SeasonLaterRepositoryStub.response ?? TestsConstants.SeasonLaterConstants.seasonLater
        
        let subject = CurrentValueSubject<SeasonLater, Error>(response)
        
        if let error = SeasonLaterRepositoryStub.error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
}
