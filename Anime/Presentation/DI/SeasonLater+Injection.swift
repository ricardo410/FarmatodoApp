//
//  NewSeasson+Injection.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerSeasonLaterDependencies() {
        registerSeasonLaterViewModelDependencies()
        registerSeasonLaterViewDependencies()
    }
    
    static func registerSeasonLaterViewModelDependencies() {
        typealias listTopAnimeUseCaseType = AnyUseCase<String, SeasonLater>
        
        register(SeasonLaterUseCase.self) { resolver in
            return SeasonLaterUseCase(repository: resolver.resolve(SeasonLaterRepositoryType.self))
        }.implements(listTopAnimeUseCaseType.self)
    }
    
    static func  registerSeasonLaterViewDependencies() {
        typealias dependencies = SeasonLaterViewModel.Dependencies
        typealias seasonLaterUseCase = SeasonLaterUseCase
        
        register(SeasonLaterViewModel.self) { resolver in
            let dependencies = dependencies(seasonLaterUseCase: resolver.resolve(seasonLaterUseCase.self))
            return SeasonLaterViewModel(dependencies: dependencies)
        }
    }
}
