//
//  TopAnimeUseCaseTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class TopAnimeUseCaseTest: XCTestCase {
    
    private var sut: TopAnimeUseCase!
    private var stub: TopAnimeRepositoryStub!
    private var cancellable: AnyCancellable?

    override func setUp() {
        stub = TopAnimeRepositoryStub()
        sut = TopAnimeUseCase(repository: stub)
    }
    
    override func tearDown() {
        stub = nil
        TopAnimeRepositoryStub.response = nil
        TopAnimeRepositoryStub.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }

    func test_WhenGetTopAnimes_ThenResponseSuccess() {
        let successfulExpectation = expectation(description: "successful Expectation")
        let failureExpectation = expectation(description: "failure Expectation")
        failureExpectation.isInverted = true
     
        cancellable = sut.execute(params: "")
            .sink{ completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                failureExpectation.fulfill()
                
            } receiveValue: { top in
                XCTAssertFalse(top.animes.isEmpty)
                successfulExpectation.fulfill()
            }
        
        wait(for: [successfulExpectation, failureExpectation], timeout: 1.0)
        cancellable?.cancel()
    }

    func test_WhenGetTopAnimes_ThenResponseError() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Service Response Expectation")
        expectation.isInverted = true
        
        TopAnimeRepositoryStub.error = CustomErrors.APIRequest.emptyJson
        // When
        cancellable = sut.execute(params: "")
            .sink(
                receiveCompletion: { completion in
                    guard case .failure(let error) = completion else { return
                        XCTFail("completion is not a failure")
                    }
                    let jsonEmptyError = CustomErrors.APIRequest.emptyJson.localizedDescription
                    XCTAssertEqual(error.localizedDescription, jsonEmptyError)
                    expectationFailure.fulfill()
                },
                receiveValue: { _ in
                    // Then
                    expectation.fulfill()
                })

        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }

}
