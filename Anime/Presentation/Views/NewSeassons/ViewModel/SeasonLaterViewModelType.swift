//
//  NewSeassonViewModel.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

protocol SeasonLaterViewModelType: ObservableObject {
    var state: SeasonLaterState { get set }
    func getSeasonLater()
}
