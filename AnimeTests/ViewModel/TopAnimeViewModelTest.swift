//
//  TopAnimeViewModelTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//
import XCTest
import Combine
@testable import Anime

class TopAnimeViewModelTest: XCTestCase {

    typealias Dependencies = TopAnimeViewModel.Dependencies
    
    private var sut: TopAnimeViewModel!
    private var dependencies: Dependencies!
    private var stub: TopAnimeUseCaseStub!
    
    override func setUp() {
        super.setUp()
        stub = TopAnimeUseCaseStub()
        dependencies = Dependencies(listTopAnimeUseCase: stub)
    }
    
    override func tearDown() {
        sut = nil
        TopAnimeUseCaseStub.response = nil
        TopAnimeUseCaseStub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func test_WhenGetListTopAnimes_ThenResponseFailed() {
        //given
        let expectation = expectation(description: "Top Animes response failed")

        TopAnimeUseCaseStub.response = TestsConstants.TopAnimeConstant.emptyTopAnime
        
        //When
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getListTopAnimes()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.listTopAnimes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_WhenGetListTopAnimes_ThenResponseSuccess() {
        //given
        let expectation = expectation(description: "Top Animes response successfully")
        
        TopAnimeUseCaseStub.response = TestsConstants.TopAnimeConstant.topAnimeMain
        //given
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getListTopAnimes()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.listTopAnimes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
