//
//  DetailAnimeView.swift
//  Anime
//
//  Created by William Ardila on 2/03/22.
//

import SwiftUI
import NavigationStack

struct DetailAnimeView<ViewModelType>: View  where ViewModelType: DetailAnimeViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @State private var showWebView = false
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder
    var subHeaderView: some View {
        HStack(spacing: 20) {
            VStackViewText(title: CoreConstants.DetailView.score,
                           subtitle: $viewModel.state.score)
            VStackViewText(title: CoreConstants.DetailView.rank,
                           subtitle: $viewModel.state.rank)
            VStackViewText(title: CoreConstants.DetailView.popularity,
                           subtitle: $viewModel.state.popularity)
        }.padding()
    }
    
    @ViewBuilder
    var frontContent: some View {
        HStack {
            AsyncImage(url: viewModel.state.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .cornerRadius(10)
            Spacer()
            VStack {
                VStack(spacing: 10) {
                    Text(CoreConstants.DetailView.premier)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)
                    Text(viewModel.state.premieredDate)
                        .foregroundColor(Color.purple)
                }.padding()
                VStack(spacing: 10) {
                    Text(CoreConstants.DetailView.studio)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)
                    ForEach(viewModel.state.studios, id: \.id) { studio in
                        Text(studio.name)
                            .foregroundColor(Color.purple)
                    }
                }
                Text(viewModel.state.rating)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.purple)
                    .padding([.top,.bottom])
            }
        }
    }
    
    @ViewBuilder
    var backContent: some View {
        VStack {
            HStackViewText(title: CoreConstants.DetailView.scoreBy,
                           subtitle: $viewModel.state.scoredBy)
            HStackViewText(title: CoreConstants.DetailView.episodes,
                           subtitle: $viewModel.state.episodes)
            HStackViewText(title: CoreConstants.DetailView.members,
                           subtitle: $viewModel.state.members)
            HStackViewText(title: CoreConstants.DetailView.status,
                           subtitle: $viewModel.state.status)
            HStackViewText(title: CoreConstants.DetailView.type,
                           subtitle: $viewModel.state.type)
        }
    }
    
    @ViewBuilder
    var cardView: some View {
        Flashcard(front: {
            frontContent
        }) {
            backContent
        }.overlay(
            ZStack {
                Image(CoreConstants.Image.rotating)
                    .resizable()
                    .frame(width: 30, height: 30)
            }, alignment: .topTrailing)
    }
    
    @ViewBuilder
    var genreView: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.state.genre, id: \.id) { genre in
                    Text(genre.name)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .opacity(0.9)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    @ViewBuilder
    var ButtonView: some View {
        Button {
            showWebView.toggle()
        } label: {
            Text(CoreConstants.DetailView.trailer)
                .foregroundColor(Color.white)
            
        }.frame(width: 50, height: 10)
            .padding()
            .background(Color.purple)
            .cornerRadius(10)
            .sheet(isPresented: $showWebView) {
                WebView(url: viewModel.state.trailer)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text(viewModel.state.title)
                        .padding([.leading, .trailing])
                        .multilineTextAlignment(.center)
                        .font(.bold(.largeTitle)())
                        .foregroundColor(Color.purple)
                    subHeaderView
                    cardView
                    Text(viewModel.state.titleEnglish)
                        .font(.bold(.subheadline)())
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.purple)
                        .padding()
                    genreView
                    Text(viewModel.state.synopsis)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.purple)
                    
                }
                ButtonView
            }.onChange(of: viewModel.state.isShowError) { _ in
                navigationStack.pop()
            }
            .background(Color.black)
            
            .navigationBarTitle(Text(CoreConstants.DetailView.title))
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
        }.onAppear() {
            viewModel.getDetail()
        }
    }
    
}
