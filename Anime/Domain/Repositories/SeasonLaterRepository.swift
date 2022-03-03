//
//  SeasonLaterRepository.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

final class SeasonLaterRepository: BaseRequestService {}

extension SeasonLaterRepository: SeasonLaterRepositoryType {
    
    func getSeasonLater() -> AnyPublisher<SeasonLater, Error> {
        
        let path = CoreConstants.Urls.seasonNow
        
        let endPoint = APIRequest<APISeasonLater>(method: .get,
                                                  relativePath: path,
                                                  parameters: [:])
        return networkService.request(endPoint,
                                      queue: .main,
                                      retries: 0)
            .tryMap { Apidata in
                SeasonLaterMapper.map(Apidata)
                
            }.eraseToAnyPublisher()
    }
}
