//
//  SearchState.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

class SearchAnimeState: ObservableObject, Identifiable {
    var searchText: String = CoreConstants.Values.empty
    var isShowCancelButton: Bool = false
}
