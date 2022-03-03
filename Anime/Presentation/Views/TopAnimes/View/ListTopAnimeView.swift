//
//  TopAnimeView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import SwiftUI
import NavigationStack

struct ListTopAnimeView<ViewModelType>: View  where ViewModelType: TopAnimeViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    @EnvironmentObject private var navigationStack: NavigationStack

    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.state.listTopAnimes, id: \.id) { top in
                    ZStack {
                        AsyncImage(url: top.image) { image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 200, height: 200)
                            .overlay(
                                ZStack {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .shadow(color: .purple, radius: 2, x: 0, y: 2)
                                        .offset(x: 30, y: -40)
                                    Text(String(top.rank))
                                        .foregroundColor(Color.purple)
                                        .offset(x: 30, y: -40)
                                    
                                }, alignment: .topTrailing)
                            .onTapGesture {
                                navigationStack.push(viewModel.goToDetailAnimeView(id: top.id))
                                
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.purple)
                                    .shadow(color: .white, radius: 2, x: 0, y: 2)
                            )
                            .padding()
                        HStack {
                            Image(systemName: CoreConstants.SystemImages.star)
                                .foregroundColor(Color.yellow)
                            Text(String(top.score))
                                .foregroundColor(Color.white)
                        }.padding()
                            .background(Color.purple)
                            .opacity(0.9)
                            .cornerRadius(10)
                            .offset(x: -90, y: 100)
                    }
                }
            }.onChange(of: viewModel.state.isShowError) { _ in
                viewModel.getListTopAnimes()
            }
        }.onAppear() {
            viewModel.getListTopAnimes()
        }
    }
}
