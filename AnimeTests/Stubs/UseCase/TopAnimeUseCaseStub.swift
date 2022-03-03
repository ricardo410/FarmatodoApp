//
//  TopAnimUseCaseStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

final class TopAnimeUseCaseStub: AnyUseCase<Any?, TopAnimeMain> {
    
    static var response: TopAnimeMain?
    static var error: Error?
    
    override func execute(params: Any?) -> AnyPublisher<TopAnimeMain, Error> {
        
        let publisher = CurrentValueSubject<TopAnimeMain, Error>(TopAnimeUseCaseStub.response!)
        
        if let error = TopAnimeUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
