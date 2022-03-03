//
//  TopAnimeViewModelType.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftUI

protocol TopAnimeViewModelType: ObservableObject {
    var state: ListTopAnimeState { get set }
    func getListTopAnimes()
    func goToDetailAnimeView(id: Int) -> AnyView
    
}
