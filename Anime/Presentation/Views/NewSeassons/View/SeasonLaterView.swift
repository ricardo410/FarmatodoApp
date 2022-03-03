//
//  NewSeassonView.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import SwiftUI

struct SeasonLaterView<ViewModelType>: View  where ViewModelType: SeasonLaterViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    var body: some View {
        LazyVStack {
            ForEach(viewModel.state.seasons, id: \.id) { season in
                Divider().background(Color.purple)
                Flashcard(front: {
                    HStack {
                        AsyncImage(url: season.image) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 120, height: 120)
                            .padding()
                            .clipShape(Capsule())
                        Spacer()
                        VStack {
                            Text(season.title)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .font(Font.system(size: 10))
                                .foregroundColor(Color.purple)
                                .padding()
                        }
                    }
                }, back: {
                    Text(season.synopsis)
                        .foregroundColor(Color.purple)
                }).overlay(
                    ZStack {
                        Image(CoreConstants.Image.rotating)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }, alignment: .topTrailing)
            }.onChange(of: viewModel.state.isShowError) { _ in
                viewModel.getSeasonLater()
            }
        }.background(Color.black)
            .onAppear {
                viewModel.getSeasonLater()
            }
    }
}
