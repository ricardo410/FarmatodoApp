//
//  DetailAnimeRepositoryType.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

public protocol DetailAnimeRepositoryType {
    func getDetail(id: Int) -> AnyPublisher<DetailAnime, Error>
}
