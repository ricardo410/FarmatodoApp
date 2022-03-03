//
//  VStackViewText.swift
//  Anime
//
//  Created by William Ardila on 3/03/22.
//

import SwiftUI

struct VStackViewText: View {
    @State var title: String
    @Binding var subtitle: String
    init(title: String, subtitle: Binding<String>) {
        self.title = title
        self._subtitle = subtitle
    }
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Color.white)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(subtitle)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
        }.padding()
            .background(Color.purple)
            .opacity(0.9)
            .cornerRadius(10)
    }
}
