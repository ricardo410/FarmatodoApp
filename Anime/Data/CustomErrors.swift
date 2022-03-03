//
//  CustomErrors.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import UIKit

struct CustomErrors {
    enum APIRequest: Error {
        case requestFailed(statusCode: Int, message: String)
        case malFormedURL
        case invalidResponse
        case invalidStatusCode
        case serverError
        case emptyJson
    }
        enum serviceRequest: Error, Equatable {
        case serverError(statusCode: Int)
    }
}
