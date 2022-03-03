//
//  ContentView.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import SwiftUI
import NavigationStack
import Resolver

struct ContentView: View {
    var body: some View {
        NavigationStackView(transitionType: .custom(.opacity), easing: .spring(response: 0.5, dampingFraction: 0.25, blendDuration: 0.5)) {
            HomeView(viewModel: Resolver.resolve(HomeViewModel.self))
        }
    }
}
