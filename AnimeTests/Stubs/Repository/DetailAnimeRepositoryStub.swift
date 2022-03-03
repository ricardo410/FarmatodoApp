//
//  DetailAnimeRepositoryStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Combine
@testable import Anime

final class DetailAnimeRepositoryStub {
    static var response: DetailAnime?
    static var error: Error?
}

extension DetailAnimeRepositoryStub: DetailAnimeRepositoryType {
    func getDetail(id: Int) -> AnyPublisher<DetailAnime, Error> {
        
        let response = DetailAnimeRepositoryStub.response ?? TestsConstants.DetailAnimeConstants.detailAnime
        
        let subject = CurrentValueSubject<DetailAnime, Error>(response)
        
        if let error = DetailAnimeRepositoryStub.error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }
}
