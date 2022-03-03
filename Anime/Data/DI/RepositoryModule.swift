//
//  RepositoryModule.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

public class RepositoryModule {
    
    private let networkService: NetworkService
    private let session = URLSession(configuration: .default)
    public init() {
        self.networkService = NetworkService(urlSession: session, url: CoreConstants.Urls.base)
    }
    
    public lazy var topAnimeRepository: TopAnimeRepositoryType = {
        TopAnimeRepository(networkService: networkService)
    }()
    
    public lazy var searchAnimeRepository: SearchAnimeRepositoryType = {
        SearchAnimeRepository(networkService: networkService)
    }()
    
    public lazy var seasonLaterRepository: SeasonLaterRepositoryType = {
        SeasonLaterRepository(networkService: networkService)
    }()
    
    
    public lazy var detailAnimeRepository: DetailAnimeRepositoryType = {
        DetailAnimeRepository(networkService: networkService)
    }()
    
}

