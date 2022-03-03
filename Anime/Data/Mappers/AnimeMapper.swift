//
//  AnimeMapper.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

final class AnimeMapper {
    static func map(_ ApiData: APIAnime) -> Anime {
        
        return Anime(id: ApiData.id,
                     image: ApiData.image,
                     title: ApiData.title,
                     type: ApiData.type?.rawValue ?? "",
                     episodes: ApiData.episodes,
                     members: ApiData.members,
                     score: ApiData.score,
                     synopsis: ApiData.synopsis)
    }
}
