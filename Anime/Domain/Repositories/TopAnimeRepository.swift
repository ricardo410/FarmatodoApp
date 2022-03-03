//
//  ListTopAnimeRepository.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

final class TopAnimeRepository: BaseRequestService {}

extension TopAnimeRepository: TopAnimeRepositoryType {
    
    func getTopAnimes() -> AnyPublisher<TopAnimeMain, Error> {
        
        let path = CoreConstants.Urls.animeTop
        
        let endPoint = APIRequest<APITopAnimeMain>(method: .get,
                                                   relativePath: path,
                                                   parameters: [:])
        return networkService.request(endPoint,
                                      queue: .main,
                                      retries: 0)
            .tryMap { Apidata in
                TopAnimeMainMapper.map(Apidata)
                
            }.eraseToAnyPublisher()
    }
}
