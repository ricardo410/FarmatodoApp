//
//  APIDetailAnime.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

struct APIDetailAnime: Decodable {
    var id: Int
    var image: URL?
    var trailer: URL?
    var title: String
    var titleEnglish: String?
    var synopsis: String?
    var type: APIAnimeType?
    var episodes: Int?
    var score: Double?
    var scoredBy: Int?
    var members: Int?
    var rank: Int?
    var popularity: Int?
    var premieredDate: String?
    var rating: String?
    var status: String?
    var genres: [APIShortDisplay]
    var studios: [APIShortDisplay]
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case title, synopsis, type, episodes, score, members, popularity, rank, rating, status, genres, studios
        case image = "image_url"
        case trailer = "trailer_url"
        case titleEnglish = "title_english"
        case scoredBy = "scored_by"
        case premieredDate = "premiered"
    }
    
}

struct APIShortDisplay: Decodable {
    var malID: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case name
    }
}

