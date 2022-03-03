//
//  APIRequest.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Alamofire

public class APIRequest<Response> {
    let method: HTTPMethod
    let relativePath: String
    let parameters: [String: Any]?
    let parameterEncoding: ParameterEncoding
    let contentType: APIContentType
    
    init(method: HTTPMethod = .get,
         relativePath: String,
         parameters: [String: Any]? = nil,
         parameterEncoding: ParameterEncoding = URLEncoding.default,
         contentType: APIContentType = APIContentType.json) {
        self.method = method
        self.relativePath = relativePath
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.contentType = contentType
    }
}

public enum APIContentType: String {
    case json = "application/json"
}
