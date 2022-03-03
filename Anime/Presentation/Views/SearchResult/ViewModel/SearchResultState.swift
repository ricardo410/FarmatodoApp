//
//  SearchResultState.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

class SearchResultState: ObservableObject, Identifiable {
    var animes: [Anime] = []
    var errorMessage: String = CoreConstants.Values.empty
    var isShowError: Bool =  false
}
