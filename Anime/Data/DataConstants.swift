//
//  DataConstants.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

struct DataConstants {
    enum StatusCodes: Int {
        case successStatusCode = 200
        case pageNotFound = 404
        case internalServerErrorStatusCode = 500
        
        init(from rawValue: Int) {
            self = StatusCodes(rawValue: rawValue) ?? .internalServerErrorStatusCode
        }
    }
}
