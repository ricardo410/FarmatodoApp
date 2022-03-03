//
//  AnyUseCase.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Combine

protocol UseCase {
    associatedtype Response
    associatedtype Params
    
    func execute(params: Params) -> AnyPublisher<Response, Error>
}

open class AnyUseCase<Input, Output>: UseCase {
    public typealias Response = Output
    public typealias Params = Input
    
    open func execute(params: Input) -> AnyPublisher<Output, Error> {
        fatalError("This method must be implemented")
    }
}

