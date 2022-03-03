//
//  DetailAnimeRepository.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

final class DetailAnimeRepository: BaseRequestService {}

extension DetailAnimeRepository: DetailAnimeRepositoryType {
    
    func getDetail(id: Int) -> AnyPublisher<DetailAnime, Error> {
        let params = ["" : id]
        
        let path = CoreConstants.Urls.detailAnime
        
        let endPoint = APIRequest<APIDetailAnime>(method: .get,
                                                  relativePath: path,
                                                  parameters: params)
        
        return networkService.request(endPoint,
                                      queue: .main,
                                      retries: 0)
            .tryMap { Apidata in
                DetailAnimeMapper.map(Apidata)
                
            }.eraseToAnyPublisher()
    }
}
