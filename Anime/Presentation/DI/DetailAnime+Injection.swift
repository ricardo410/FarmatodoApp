//
//  DetailAnime+Injection.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerDetailAnimeDependencies(id: Int) {
        registerDetailAnimeViewModelDependencies()
        registerDetailAnimeViewDependencies(id: id)
    }
    
    static func registerDetailAnimeViewModelDependencies() {
        typealias detailAnimeUseCaseType = AnyUseCase<Int, DetailAnime>
        
        register(DetailAnimeUseCase.self) { resolver in
            return DetailAnimeUseCase(repository: resolver.resolve(DetailAnimeRepositoryType.self))
        }.implements(detailAnimeUseCaseType.self)
    }
    
    static func  registerDetailAnimeViewDependencies(id: Int) {
        typealias dependencies =  DetailAnimeViewModel.Dependencies
        typealias detailAnimeUseCase = DetailAnimeUseCase
        
        register(DetailAnimeViewModel.self) { resolver in
            
            let dependencies = dependencies(id: id,
                                            detailAnimeUseCase: resolver.resolve(detailAnimeUseCase.self))
            return DetailAnimeViewModel(dependencies: dependencies)
        }
    }
}
