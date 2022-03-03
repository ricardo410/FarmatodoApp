//
//  DetailAnimeViewModel.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import Foundation
import Combine

class DetailAnimeViewModel: BaseViewModel {
    
    private let dependencies: Dependencies
    private var subscribers: Set<AnyCancellable> = []
    
    @Published var state = DetailAnimeState()
    
    struct Dependencies {
        var id: Int
        var detailAnimeUseCase: AnyUseCase<Int, DetailAnime>
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
        self.loading = true
        getDetail()
    }
    
    private func fillDetail(detail: DetailAnime?) {
        state.id = detail?.id ?? 0
        state.image = detail?.image ?? URL(fileURLWithPath: CoreConstants.Values.empty)
        state.trailer =  detail?.trailer ?? URL(fileURLWithPath: CoreConstants.Values.empty)
        state.title = detail?.title ?? CoreConstants.Values.empty
        state.titleEnglish = detail?.titleEnglish ?? CoreConstants.Values.empty
        state.synopsis  = detail?.synopsis  ?? CoreConstants.Values.empty
        state.type = detail?.type ?? CoreConstants.Values.empty
        state.episodes = String(detail?.episodes ?? 0)
        state.score = String(detail?.score ?? 0.0)
        state.scoredBy = String(detail?.scoredBy ?? 0)
        state.members = String(detail?.members ?? 0)
        state.rank = String(detail?.rank ?? 0)
        state.popularity  = String(detail?.popularity ?? 0)
        state.premieredDate  = detail?.premieredDate ?? CoreConstants.Values.empty
        state.rating = detail?.rating ?? CoreConstants.Values.empty
        state.status = detail?.status ?? CoreConstants.Values.empty
        state.studios = detail?.studios ?? []
        state.genre = detail?.genre ?? []
        objectWillChange.send()
    }
    
    private func showError(messageError: String) {
        genericSpinner(message: messageError,
                       subtitle: CoreConstants.Values.tryAgain ) {
            self.state.isShowError = true
            self.objectWillChange.send()
        }
    }
    
}

extension DetailAnimeViewModel: DetailAnimeViewModelType {
    func getDetail() {
        dependencies.detailAnimeUseCase
            .execute(params: dependencies.id)
            .subscribe(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard case .failure(let error) = error else { return }
                self?.showError(messageError: error.localizedDescription)
            } receiveValue: { [weak self] value in
                self?.fillDetail(detail: value)
                self?.loading = false
            }.store(in: &subscribers)
    }
}
