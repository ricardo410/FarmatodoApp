//
//  NetworkServiceStub.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Anime
import Combine
import Foundation

class NetworkServiceStub<Resp: Decodable>: Anime.NetworkServiceType {
    var response: Resp!
    var error: Error?
    
    private func publish<Response: Decodable>() -> AnyPublisher<Response, Error> {
        if response == nil, error == nil {
            fatalError("Both values can not be nil")
        }
        
        let subject = CurrentValueSubject<Response, Error>(response as! Response)
        
        if let error = error {
            subject.send(completion: .failure(error))
        }
        
        return subject.eraseToAnyPublisher()
    }

    func request<Response>(_ endpoint: APIRequest<Response>, queue: DispatchQueue, retries: Int) -> AnyPublisher<Response, Error> where Response : Decodable {
        publish()
    }
    
    func setBaseUrl(_ baseUrl: String) {
        print(baseUrl)
    }
    
}
