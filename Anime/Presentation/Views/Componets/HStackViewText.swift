//
//  HStackViewText.swift
//  Anime
//
//  Created by William Ardila on 3/03/22.
//

import SwiftUI

struct HStackViewText: View {
    @State var title: String
    @Binding var subtitle: String
    init(title: String, subtitle: Binding<String>) {
        self.title = title
        self._subtitle = subtitle
    }
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.purple)
            Text(subtitle)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.purple)
        }
    }
}
