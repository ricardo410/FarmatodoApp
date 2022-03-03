//
// APP+Injection.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerAppRepositories()
        registerHomeDependencies()
        registerTopAnimeDependencies()
        registerSeachAnimeDependencies()
        registerSeasonLaterDependencies()
        
    }
}

extension Resolver {
    
    static func registerAppRepositories() {
        let repository = RepositoryModule()
        
        register(TopAnimeRepositoryType.self) { _ in
            return repository.topAnimeRepository
        }
        
        register(SearchAnimeRepositoryType.self) { _ in
            return repository.searchAnimeRepository
        }
        
        register(SeasonLaterRepositoryType.self) { _ in
            return repository.seasonLaterRepository
        }
        
        register(DetailAnimeRepositoryType.self) { _ in
            return repository.detailAnimeRepository
        }
    }
}
