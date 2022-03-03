//
//  ResignKeyboardOnDragGesture.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftUI

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
