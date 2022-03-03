//
//  sfsfsdf.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import SwiftUI

struct APITopAnimeMain: Decodable {
    var top: [APITopAnime]
    
    enum CodingKeys: String, CodingKey { case top }
}
struct APITopAnime: Decodable {
    var rank: Int
    var id: Int
    var image: URL?
    var score: Double
    
    enum CodingKeys: String, CodingKey {
        case rank,score
        case id = "mal_id"
        case image = "image_url"
       
    }
}
