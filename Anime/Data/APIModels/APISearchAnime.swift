//
//  APIAnime.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

struct APISearchAnime: Decodable {
    let results: [APIAnime]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
