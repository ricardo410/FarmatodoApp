//
//  CustomErrors+ApiRequest+Extension.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

extension CustomErrors.APIRequest {
    init?(statusCode: DataConstants.StatusCodes, description: String? = nil, data: Data? = nil) {
        switch statusCode {
        case .internalServerErrorStatusCode:
            self = .serverError
        default:
            return nil
        }
    }
}
