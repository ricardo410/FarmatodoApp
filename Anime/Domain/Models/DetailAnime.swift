//
//  DetailAnime.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

public struct DetailAnime: Codable {
    
    var id: Int
    var image: URL?
    var trailer: URL?
    var title: String
    var titleEnglish: String?
    var synopsis: String?
    var type: String?
    var episodes: Int?
    var score: Double?
    var scoredBy: Int?
    var members: Int?
    var rank: Int?
    var popularity: Int?
    var premieredDate: String?
    var rating: String?
    var status: String?
    var studios: [ShortDisplay]
    var genre: [ShortDisplay]
    
    init(id: Int,
         image: URL?,
         trailer: URL?,
         title: String,
         titleEnglish: String?,
         synopsis: String?,
         type: String?,
         episodes: Int?,
         score: Double?,
         scoredBy: Int?,
         members: Int?,
         rank: Int?,
         popularity: Int?,
         premieredDate: String?,
         rating: String?,
         status: String?,
         studios: [ShortDisplay],
         genre: [ShortDisplay]) {
        self.id = id
        self.image = image
        self.trailer = trailer
        self.title = title
        self.titleEnglish = titleEnglish
        self.synopsis = synopsis
        self.type = type
        self.episodes = episodes
        self.score = score
        self.scoredBy = scoredBy
        self.members = members
        self.rank = rank
        self.popularity = popularity
        self.premieredDate = premieredDate
        self.rating = rating
        self.status = status
        self.studios = studios
        self.genre = genre
    }
    
}

class ShortDisplay: Codable {
    var id: Int
    var name: String
    
    init(id: Int, name: String ) {
        self.id = id
        self.name = name
    }
}
