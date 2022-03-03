//
//  SeasonLaterMapper.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

final class SeasonLaterMapper {
    static func map(_ ApiData: APISeasonLater) -> SeasonLater {

        let anime =  ApiData.anime.map { AnimeMapper.map($0) }
        
        return SeasonLater(anime: anime)
    }
}
