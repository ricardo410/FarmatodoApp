//
//  ListTopAnimeUseCase.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

class TopAnimeUseCase: AnyUseCase<Any?, TopAnimeMain> {
    
    private let repository: TopAnimeRepositoryType
    
    public init(repository: TopAnimeRepositoryType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<TopAnimeMain, Error> {
        return repository.getTopAnimes()
    }
}
