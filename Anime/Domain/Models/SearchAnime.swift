//
//  AnimeModel.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftUI

public struct SearchAnime: Codable {
    let results: [Anime]
    
    init(results: [Anime]) {
        self.results = results
    }
}
