//
//  SeasonLaterUseCaseStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

final class SeasonLaterUseCaseStub: AnyUseCase<Any?, SeasonLater> {
    
    static var response: SeasonLater?
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<SeasonLater, Error> {
        
        let publisher = CurrentValueSubject<SeasonLater, Error>(SeasonLaterUseCaseStub.response!)
        
        if let error = SeasonLaterUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
