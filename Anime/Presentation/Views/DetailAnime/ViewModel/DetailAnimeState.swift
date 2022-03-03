//
//  DetailAnimeState.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import UIKit

class DetailAnimeState: ObservableObject, Identifiable {
    var id: Int = 0
    var image: URL = URL(string: CoreConstants.Values.empty) ?? URL(fileURLWithPath: CoreConstants.Values.empty)
    var trailer: URL = URL(string: CoreConstants.Values.empty) ?? URL(fileURLWithPath: CoreConstants.Values.empty)
    var title: String = CoreConstants.Values.empty
    var titleEnglish: String = CoreConstants.Values.empty
    var synopsis: String = CoreConstants.Values.empty
    var type: String = CoreConstants.Values.empty
    var episodes: String = CoreConstants.Values.empty
    var score: String = CoreConstants.Values.empty
    var scoredBy: String = CoreConstants.Values.empty
    var members: String = CoreConstants.Values.empty
    var rank: String = CoreConstants.Values.empty
    var popularity: String = CoreConstants.Values.empty
    var premieredDate: String = CoreConstants.Values.empty
    var rating: String = CoreConstants.Values.empty
    var status: String = CoreConstants.Values.empty
    var studios: [ShortDisplay] = []
    var genre: [ShortDisplay] = []
    var showWebView: Bool = false
    var isShowError: Bool = false
}
