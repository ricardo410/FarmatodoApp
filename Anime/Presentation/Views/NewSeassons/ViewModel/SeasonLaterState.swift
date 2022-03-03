//
//  NewSeassonState.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

class SeasonLaterState: ObservableObject, Identifiable {
    var seasons: [Anime] = []
    var isShowError: Bool = false
}
