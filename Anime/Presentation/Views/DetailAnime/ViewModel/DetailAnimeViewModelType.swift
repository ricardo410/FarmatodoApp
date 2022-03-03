//
//  DetailAnimeViewModelType.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

protocol DetailAnimeViewModelType: ObservableObject {
    var state: DetailAnimeState { get set }
    func getDetail()
}
