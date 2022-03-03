//
//  Home+Injection.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Resolver

extension Resolver {
    
    static func registerHomeDependencies() {
        registerHomeViewDependencies()
    }
    
    static func  registerHomeViewDependencies() {
        
        register(HomeViewModel.self) { resolver in
            return HomeViewModel()
        }
    }
}
