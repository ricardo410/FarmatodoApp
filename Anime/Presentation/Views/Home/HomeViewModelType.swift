//
//  HomeViewModelType.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

protocol HomeViewModelType: ObservableObject {
    var state: HomeState { get set }
}
