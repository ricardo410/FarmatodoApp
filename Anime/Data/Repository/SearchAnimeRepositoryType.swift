//
//  SearchAnimeRepositoryType.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

public protocol SearchAnimeRepositoryType {
    func searchAnimes(query: String) -> AnyPublisher<SearchAnime, Error>
}
