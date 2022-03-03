//
//  DetailAnimeViewModelTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class DetailAnimeViewModelTest: XCTestCase {

    typealias Dependencies = DetailAnimeViewModel.Dependencies
    
    private var sut: DetailAnimeViewModel!
    private var dependencies: Dependencies!
    private var stub: DetailAnimeUseCaseStub!
    
    override func setUp() {
        super.setUp()
        stub = DetailAnimeUseCaseStub()
        dependencies = Dependencies(id: 1,
                                    detailAnimeUseCase: stub)
    }
    
    override func tearDown() {
        sut = nil
        DetailAnimeUseCaseStub.response = nil
        DetailAnimeUseCaseStub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func test_WhenGetDetail_ThenResponseFailed() {
        //given
        let expectation = expectation(description: "Get Detail Anime response failed")

        DetailAnimeUseCaseStub.response = TestsConstants.DetailAnimeConstants.emptyDetailAnime
        
        //When
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getDetail()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.title.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_WhenGetDetail_ThenResponseSuccess() {
        //given
        let expectation = expectation(description: "Get Detail Anime response successfully")
        
        DetailAnimeUseCaseStub.response = TestsConstants.DetailAnimeConstants.detailAnime
        //given
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getDetail()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.synopsis.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
