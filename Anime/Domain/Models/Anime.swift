//
//  Anime.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

struct Anime: Codable {
    var id: Int
    var image: URL?
    var title: String
    var type: String?
    var episodes: Int?
    var members: Int?
    var score: Double?
    var synopsis: String
    
    init(id: Int,
         image: URL?,
         title: String,
         type: String,
         episodes: Int?,
         members: Int?,
         score: Double?,
         synopsis: String) {
        self.id = id
        self.image = image
        self.title = title
        self.type = type
        self.episodes = episodes
        self.members = members
        self.score = score
        self.synopsis = synopsis
    }
}


enum AnimeType: String, Codable {
    case tv = "TV"
    case movie = "Movie"
    case ova = "OVA"
    case special = "Special"
    case ona = "ONA"
    case music = "Music"
}
