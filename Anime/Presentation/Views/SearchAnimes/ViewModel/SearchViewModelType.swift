//
//  SearchView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftUI

protocol SearchAnimeViewModelType: ObservableObject {
    var state: SearchAnimeState { get set }
    func goTosearchResultView(searchText: String) -> AnyView
}
