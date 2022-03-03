//
//  DetailAnimeUseCaseTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class DetailAnimeUseCaseTest: XCTestCase {
    
    private var sut: DetailAnimeUseCase!
    private var stub: DetailAnimeRepositoryStub!
    private var cancellable: AnyCancellable?

    override func setUp() {
        stub = DetailAnimeRepositoryStub()
        sut = DetailAnimeUseCase(repository: stub)
    }
    
    override func tearDown() {
        stub = nil
        DetailAnimeRepositoryStub.response = nil
        DetailAnimeRepositoryStub.error = nil
        sut = nil
        cancellable = nil
        super.tearDown()
    }

    func test_WhenGetDetailAnime_ThenResponseSuccess() {
        let successfulExpectation = expectation(description: "successful Expectation")
        let failureExpectation = expectation(description: "failure Expectation")
        failureExpectation.isInverted = true
     
        cancellable = sut.execute(params: 1)
            .sink{ completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                failureExpectation.fulfill()
                
            } receiveValue: { detail in
                XCTAssertFalse(detail.title.isEmpty)
                successfulExpectation.fulfill()
            }
        
        wait(for: [successfulExpectation, failureExpectation], timeout: 1.0)
        cancellable?.cancel()
    }

    func test_WhenGetDetailAnime_ThenResponseError() {
        // Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Service Response Expectation")
        expectation.isInverted = true
        
        DetailAnimeRepositoryStub.error = CustomErrors.APIRequest.emptyJson
        // When
        cancellable = sut.execute(params: 0)
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
