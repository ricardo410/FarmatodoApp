//
//  LisTopAnimeRepositoryType.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

public protocol TopAnimeRepositoryType {
    func getTopAnimes() -> AnyPublisher<TopAnimeMain, Error>
}
