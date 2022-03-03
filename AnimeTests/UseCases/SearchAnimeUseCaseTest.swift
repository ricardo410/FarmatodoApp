//
//  SearchAnimeUseCaseTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class SearchAnimeUseCaseTest: XCTestCase {
    
    private var sut: SearchAnimeUseCase!
    private var stub: SearchAnimeRepositoryStub!
    private var cancellable: AnyCancellable?

    override func setUp() {
        stub = SearchAnimeRepositoryStub()
        sut = SearchAnimeUseCase(repository: stub)
    }
    
    override func tearDown() {
        stub = nil
        SearchAnimeRepositoryStub.response = nil
        SearchAnimeRepositoryStub.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }

    func test_WhenSearchAnime_ThenResponseSuccess() {
        let successfulExpectation = expectation(description: "successful Expectation")
        let failureExpectation = expectation(description: "failure Expectation")
        failureExpectation.isInverted = true
     
        cancellable = sut.execute(params: "1")
            .sink{ completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                failureExpectation.fulfill()
                
            } receiveValue: { result in
                XCTAssertFalse(result.results.isEmpty)
                successfulExpectation.fulfill()
            }
        
        wait(for: [successfulExpectation, failureExpectation], timeout: 1.0)
        cancellable?.cancel()
    }

    func test_WhenSearchAnime_ThenResponseError() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Service Response Expectation")
        expectation.isInverted = true
        
        SearchAnimeRepositoryStub.error = CustomErrors.APIRequest.emptyJson
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
