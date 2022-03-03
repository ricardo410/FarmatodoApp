//
//  SearchResult.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import SwiftUI
import NavigationStack

struct SearchResultView<ViewModelType>: View  where ViewModelType: SearchResultViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    @EnvironmentObject private var navigationStack: NavigationStack
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
    var resultView: some View {
        List(viewModel.state.animes, id: \.id) { anime in
            HStack {
                AsyncImage(url: anime.image) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                } .frame(width: 100, height: 100)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.black)
                            .shadow(color: .white, radius: 2, x: 0, y: 2)
                    )
                    .padding()
                VStack(spacing: 5) {
                    Text(anime.title)
                        .font(Font.subheadline)
                        .multilineTextAlignment(.center)
                    Text(CoreConstants.SearchResultView.episodes + String(anime.episodes ?? 0))
                    Text(CoreConstants.SearchResultView.episodes + String(anime.score ?? 0.0))
                }
            }.onTapGesture {
                navigationStack.push(viewModel.goToDetailAnimeView(id: anime.id))
            }
        } .navigationBarTitle(Text(CoreConstants.SearchResultView.title))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        self.navigationStack.pop()
                    } label: {
                        HStack {
                            Image(systemName: CoreConstants.SystemImages.arrowBack)
                        }
                    }
                }
            }
    }
    
    var body: some View {
        NavigationView {
            resultView.onChange(of: viewModel.state.isShowError) { _ in
                navigationStack.pop()
            }
        }
    }
}
