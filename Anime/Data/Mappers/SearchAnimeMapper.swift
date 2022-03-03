//
//  SearchAnimeMapper.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

final class SearchAnimeMapper {
    static func map(_ ApiData: APISearchAnime) -> SearchAnime {

        let results =  ApiData.results.map { AnimeMapper.map($0) }
        
        return SearchAnime(results: results)
    }
}
