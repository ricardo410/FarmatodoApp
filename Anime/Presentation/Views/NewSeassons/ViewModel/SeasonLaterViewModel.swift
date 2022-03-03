//
//  NewSeassonView.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation

import Combine

class SeasonLaterViewModel: BaseViewModel {
    
    private let dependencies: Dependencies
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var state = SeasonLaterState()
    
    struct Dependencies {
        var seasonLaterUseCase: AnyUseCase<Any?, SeasonLater>
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

extension SeasonLaterViewModel: SeasonLaterViewModelType {
    
    func getSeasonLater() {
        dependencies.seasonLaterUseCase
            .execute(params: nil)
            .subscribe(on: DispatchQueue.main)
            .sink { [weak self]  completion in
                guard case .failure(let error) = completion else { return }
                self?.showError(messageError: error.localizedDescription)
            } receiveValue: { [weak self] value in
                self?.state.seasons = value.anime
                self?.objectWillChange.send()
                self?.loading = false
            }.store(in: &subscribers)
    }
}
