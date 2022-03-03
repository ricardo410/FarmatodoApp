//
//  Extensions+XCTEST.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import Combine
import XCTest

public extension XCTestCase {
    func validResponseTest<T: Publisher>(publisher: T?) -> (expectations: [XCTestExpectation], cancellable: AnyCancellable?) {
        XCTAssertNotNil(publisher)

        let expectationFinished = expectation(description: "finished")
        let expectationReceive = expectation(description: "receiveValue")
        let expectationFailure = expectation(description: "failure")
        expectationFailure.isInverted = true

        let cancellable = publisher?
            .first()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("--TEST ERROR--")
                    print(error.localizedDescription)
                    print("------")
                    expectationFailure.fulfill()
                case .finished:
                    expectationFinished.fulfill()
                }
            }, receiveValue: { response in
                XCTAssertNotNil(response)
                print(response)
                expectationReceive.fulfill()
            })
        return (expectations: [expectationFinished, expectationReceive, expectationFailure],
                cancellable: cancellable)
    }

    func invalidResponseTest<T: Publisher>(publisher: T?) -> (expectations: [XCTestExpectation], cancellable: AnyCancellable?) {
        XCTAssertNotNil(publisher)

        let expectationFinished = expectation(description: "Invalid.finished")
        expectationFinished.isInverted = true
        let expectationReceive = expectation(description: "Invalid.receiveValue")
        expectationReceive.isInverted = true
        let expectationFailure = expectation(description: "Invalid.failure")

        let cancellable = publisher?
            .first()
            .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("--TEST FULFILLED--")
                print(error.localizedDescription)
                print("------")
                expectationFailure.fulfill()
            case .finished:
                expectationFinished.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNotNil(response)
            print(response)
            expectationReceive.fulfill()
        })
        return (expectations: [expectationFinished, expectationReceive, expectationFailure],
                cancellable: cancellable)
    }
}
