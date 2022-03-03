//
//  BaseRequestService.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

class BaseRequestService {
   public private(set) var networkService: NetworkServiceType
    
    public init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
}
