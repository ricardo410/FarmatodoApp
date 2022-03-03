//
//  TopAnime+Injection.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerTopAnimeDependencies() {
        registerTopAnimeViewModelDependencies()
        registerTopAnimeViewDependencies()
    }
    
    static func registerTopAnimeViewModelDependencies() {
        typealias listTopAnimeUseCaseType = AnyUseCase<Any?, TopAnimeMain> 
        
        register(TopAnimeUseCase.self) { resolver in
            return TopAnimeUseCase(repository: resolver.resolve(TopAnimeRepositoryType.self))
        }.implements(listTopAnimeUseCaseType.self)
    }
    
    static func  registerTopAnimeViewDependencies() {
        typealias dependencies = TopAnimeViewModel.Dependencies
        typealias topAnimeUseCase = TopAnimeUseCase
        
        register(TopAnimeViewModel.self) { resolver in
            let dependencies = dependencies(listTopAnimeUseCase: resolver.resolve(topAnimeUseCase.self))
            return TopAnimeViewModel(dependencies: dependencies)
        }
    }
}
