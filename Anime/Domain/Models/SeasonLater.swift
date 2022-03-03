//
//  SeasonLater.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

public struct SeasonLater: Codable {
    let anime: [Anime]
    
    init(anime: [Anime]) {
        self.anime = anime
    }
}
