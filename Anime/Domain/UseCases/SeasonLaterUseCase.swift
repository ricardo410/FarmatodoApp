//
//  ListNewSeassonUseCase.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

class SeasonLaterUseCase: AnyUseCase<Any?, SeasonLater> {
    
    private let repository: SeasonLaterRepositoryType
    
    public init(repository: SeasonLaterRepositoryType) {
        self.repository = repository
    }
    
    override func execute(params: Any?) -> AnyPublisher<SeasonLater, Error> {
        return repository.getSeasonLater()
    }
}
