//
//  Search+Injection.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerSeachAnimeDependencies() {
        registerSeachAnimeViewModelDependencies()
        registerSeachpAnimeViewDependencies()
    }
    
    static func  registerSeachpAnimeViewDependencies() {
        
        register(SearchAnimeViewModel.self) { resolver in
            return SearchAnimeViewModel()
        }
    }
}
