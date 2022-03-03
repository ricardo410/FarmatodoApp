//
//  TopAnime.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation


public struct TopAnimeMain: Codable {
  var animes: [TopAnime]
    
    init(animes: [TopAnime]) {
        self.animes = animes
    }
}

struct TopAnime: Codable {
    var rank: Int
    var id: Int
    var image: URL?
    var score: Double
    
    init(rank: Int,
         id: Int,
         image: URL?,
         score: Double) {
        self.rank = rank
        self.id = id
        self.image = image
        self.score = score
    }
}
