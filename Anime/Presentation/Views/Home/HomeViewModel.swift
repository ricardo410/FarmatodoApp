//
//  HomeViewModel.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var state = HomeState()
    
    override init() {
        super.init()
        self.loading = true
    }
    
}

extension HomeViewModel: HomeViewModelType {}
