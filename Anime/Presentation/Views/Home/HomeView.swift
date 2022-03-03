//
//  HomeView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import SwiftUI
import Resolver

struct HomeView<ViewModelType>: View  where ViewModelType: HomeViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack{
                SearchAnimeView(viewModel: Resolver.resolve(SearchAnimeViewModel.self))
                ScrollView {
                    VStack {
                        VStack {
                            Text(CoreConstants.HomeView.top)
                                .font(.headline)
                                .foregroundColor(.purple).padding()
                            ListTopAnimeView(viewModel: Resolver.resolve(TopAnimeViewModel.self))
                                .background(Color.black)
                        }
                        VStack {
                            Text(CoreConstants.HomeView.season)
                                .font(.headline)
                                .foregroundColor(.purple).padding()
                            SeasonLaterView(viewModel: Resolver.resolve(SeasonLaterViewModel.self))
                        }
                    }
                }
            }.background(Color.black)
        }
    }
}
