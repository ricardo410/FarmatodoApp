//
//  Extension+View.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftUI

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
