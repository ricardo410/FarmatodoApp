//
//  DetailAnimeMapper.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

final class DetailAnimeMapper {
    static func map(_ ApiData: APIDetailAnime) ->  DetailAnime {

        let studios =  ApiData.studios.map { ShortDisplayMapper.map($0) }
        let genres =  ApiData.genres.map { ShortDisplayMapper.map($0) }
        
        return  DetailAnime(id: ApiData.id,
                            image: ApiData.image,
                            trailer: ApiData.trailer,
                            title: ApiData.title,
                            titleEnglish: ApiData.titleEnglish,
                            synopsis: ApiData.synopsis,
                            type: ApiData.type?.rawValue,
                            episodes: ApiData.episodes,
                            score: ApiData.score,
                            scoredBy: ApiData.scoredBy,
                            members: ApiData.members,
                            rank: ApiData.rank,
                            popularity: ApiData.popularity,
                            premieredDate: ApiData.premieredDate,
                            rating: ApiData.rating,
                            status: ApiData.status,
                            studios: studios,
                            genre: genres)
    }
}

final class ShortDisplayMapper {
    static func map(_ ApiData: APIShortDisplay) ->  ShortDisplay {
        return  ShortDisplay(id: ApiData.malID, name: ApiData.name)
                           
    }
}
