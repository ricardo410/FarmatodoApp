//
//  APIAnime.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

struct APIAnime: Decodable {
    var id: Int
    var image: URL?
    var title: String
    var type: APIAnimeType?
    var episodes: Int?
    var members: Int?
    var score: Double?
    var synopsis: String
    
    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case image = "image_url"
        case title, synopsis, type, episodes, members, score
    }
}

enum APIAnimeType: String, Codable {
    case anime = "anime"
    case tv = "TV"
    case movie = "Movie"
    case ova = "OVA"
    case special = "Special"
    case ona = "ONA"
    case music = "Music"
}
    
