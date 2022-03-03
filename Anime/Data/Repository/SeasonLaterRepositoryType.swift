//
//  SeasonLaterRepositoryType.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

public protocol SeasonLaterRepositoryType {
    func getSeasonLater() -> AnyPublisher<SeasonLater, Error>
}
