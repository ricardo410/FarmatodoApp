//
//  ListTopAnimeState.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

class ListTopAnimeState: ObservableObject, Identifiable {
    var listTopAnimes: [TopAnime] = []
    var action: () -> Void = {}
    var isShowError: Bool = false
}
