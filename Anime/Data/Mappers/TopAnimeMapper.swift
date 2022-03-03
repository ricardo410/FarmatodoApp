//
//  TopAnimeMapper.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

final class TopAnimeMainMapper {
    static func map(_ ApiData: APITopAnimeMain) -> TopAnimeMain {
        
        let topAnime =  ApiData.top.map { TopAnimeMapper.map($0) }
        return TopAnimeMain(animes: topAnime)
    }
}

final class TopAnimeMapper {
    static func map(_ ApiData: APITopAnime) -> TopAnime {
        return TopAnime(rank: ApiData.rank,
                        id: ApiData.id,
                        image: ApiData.image,
                        score: ApiData.score)
        
    }
}
