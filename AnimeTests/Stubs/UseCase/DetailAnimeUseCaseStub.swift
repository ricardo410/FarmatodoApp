//
//  DetailAnimUseCaseStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

final class DetailAnimeUseCaseStub: AnyUseCase<Int, DetailAnime> {
    
    static var response: DetailAnime?
    static var error: Error?
    
    override func execute(params: Int) -> AnyPublisher<DetailAnime, Error> {
        
        let publisher = CurrentValueSubject<DetailAnime, Error>(DetailAnimeUseCaseStub.response!)
        
        if let error = DetailAnimeUseCaseStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
