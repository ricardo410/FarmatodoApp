//
//  DetailAnimeUseCase.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

class DetailAnimeUseCase: AnyUseCase<Int, DetailAnime> {
    
    private let repository: DetailAnimeRepositoryType
    
    public init(repository: DetailAnimeRepositoryType) {
        self.repository = repository
    }
    
    override func execute(params: Int) -> AnyPublisher<DetailAnime, Error> {
        return repository.getDetail(id: params)
    }
}
