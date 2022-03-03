//
//  APISeasonLater.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

struct APISeasonLater: Decodable {
    let anime: [APIAnime]
    
    enum CodingKeys: String, CodingKey {
        case anime
    }
}
