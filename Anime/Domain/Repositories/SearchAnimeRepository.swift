//
//  SearchAnimeRepository.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

final class SearchAnimeRepository: BaseRequestService {}

extension SearchAnimeRepository: SearchAnimeRepositoryType {
    
    func searchAnimes(query: String) -> AnyPublisher<SearchAnime, Error> {
        let params = ["q" : query]
        
        let path = CoreConstants.Urls.searchAnime
        
        let endPoint = APIRequest<APISearchAnime>(method: .get,
                                                  relativePath: path,
                                                  parameters: params)
        
        return networkService.request(endPoint,
                                      queue: .main,
                                      retries: 0)
            .tryMap { Apidata in
                SearchAnimeMapper.map(Apidata)
                
            }.eraseToAnyPublisher()
    }
}
