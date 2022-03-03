//
//  NetworkServiceType.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine

public protocol NetworkServiceType {
    func request<Response>(_ endpoint: APIRequest<Response>,
                           queue: DispatchQueue,
                           retries: Int) -> AnyPublisher<Response, Error> where Response : Decodable
    func setBaseUrl(_ baseUrl: String)
    
}
