//
//  Extension+UIApplication.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
