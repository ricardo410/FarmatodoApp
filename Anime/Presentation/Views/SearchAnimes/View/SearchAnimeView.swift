//
//  SearchView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import SwiftUI
import Combine
import NavigationStack

struct SearchAnimeView<ViewModelType>: View  where ViewModelType: SearchAnimeViewModelType {
    
    @ObservedObject var viewModel: ViewModelType
    @EnvironmentObject private var navigationStack: NavigationStack
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: CoreConstants.SystemImages.search)
                TextField(CoreConstants.SearchView.search, text: $viewModel.state.searchText, onEditingChanged: { isEditing in
                    viewModel.state.isShowCancelButton = true
                }, onCommit: {
                    navigationStack.push(viewModel.goTosearchResultView(searchText: viewModel.state.searchText))
                }).foregroundColor(.primary)
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            if viewModel.state.isShowCancelButton  {
                Button(CoreConstants.SearchView.cancel) {
                    UIApplication.shared.endEditing(true)
                    viewModel.state.searchText = CoreConstants.Values.empty
                    viewModel.state.isShowCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}
