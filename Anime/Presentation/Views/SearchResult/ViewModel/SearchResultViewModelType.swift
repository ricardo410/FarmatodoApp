//
//  SearchResultViewModelType.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import SwiftUI

protocol SearchResultViewModelType: ObservableObject {
    var state: SearchResultState { get set }
    func getAnimes()
    func goToDetailAnimeView(id: Int) -> AnyView
}
