//
//  TopAnimeView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine
import SwiftUI
import Resolver

class TopAnimeViewModel: BaseViewModel {
    
    private let dependencies: Dependencies
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var state = ListTopAnimeState()
    
    struct Dependencies {
        var listTopAnimeUseCase: AnyUseCase<Any?, TopAnimeMain>
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        self.loading = true
    }
    
    private func showError(messageError: String) {
        genericSpinner(message: messageError,
                       subtitle: CoreConstants.Values.tryAgain ) {
            self.state.isShowError = true
            self.objectWillChange.send()
        }
    }
    
}

extension TopAnimeViewModel: TopAnimeViewModelType {
    
    func goToDetailAnimeView(id: Int) -> AnyView {
        Resolver.registerDetailAnimeDependencies(id: id)
        return AnyView(DetailAnimeView(viewModel: Resolver.resolve(DetailAnimeViewModel.self)))
    }
    
    func getListTopAnimes() {
        dependencies.listTopAnimeUseCase
            .execute(params: nil)
            .subscribe(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(messageError: error.localizedDescription)
            } receiveValue: { [weak self] value in
                self?.state.listTopAnimes = value.animes
                self?.objectWillChange.send()
                self?.loading = false
            }.store(in: &subscribers)
    }
}
