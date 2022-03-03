//
//  SearchResultViewModel.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine
import SwiftUI
import Resolver

class SearchResultViewModel: BaseViewModel {
    
    private let dependencies: Dependencies
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var state = SearchResultState()
    
    struct Dependencies {
        var searchText:String
        var searchAnimeUseCase: AnyUseCase<String, SearchAnime>
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        self.loading = true
        getAnimes()
    }
    
    private func showError(messageError: String) {
        genericSpinner(message: messageError,
                       subtitle: CoreConstants.Values.tryAgain ) {
            self.state.isShowError = true
            self.objectWillChange.send()
        }
    }
}

extension SearchResultViewModel: SearchResultViewModelType {
    func goToDetailAnimeView(id: Int) -> AnyView {
        Resolver.registerDetailAnimeDependencies(id: id )
        return AnyView(DetailAnimeView(viewModel: Resolver.resolve(DetailAnimeViewModel.self)))
    }
    
    func getAnimes() {
        dependencies.searchAnimeUseCase
            .execute(params: dependencies.searchText)
            .subscribe(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard case .failure(let error) = error else { return }
                self?.showError(messageError: error.localizedDescription)
            } receiveValue: { [weak self] value in
                self?.state.animes = value.results
                self?.objectWillChange.send()
                self?.loading = false
            }.store(in: &subscribers)
    }
    
}
