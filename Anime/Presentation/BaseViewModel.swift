//
//  BaseViewModel.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import SwiftSpinner
import UIKit
import SwiftUI

class BaseViewModel {
    
    var gesture: () -> Void = {}
    
    var loading: Bool = false {
        didSet {
            if self.loading {
                SwiftSpinner.show(duration: 100000, title: CoreConstants.Values.loadingMessage)
                
            } else {
                SwiftSpinner.hide()
            }
        }
    }
    
    public func genericSpinner(message: String, subtitle: String, action: @escaping () -> Void = {}) {
        SwiftSpinner.show(duration: 10000, title: message).addTapHandler({
            action()
            SwiftSpinner.hide()
        }, subtitle: subtitle)
    }
    
}
