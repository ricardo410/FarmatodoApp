//
//  SearchResultViewModelTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class SearchResultViewModelTest: XCTestCase {

    typealias Dependencies = SearchResultViewModel.Dependencies
    
    private var sut: SearchResultViewModel!
    private var dependencies: Dependencies!
    private var stub: SearchAnimeUseCaseStub!
    
    override func setUp() {
        super.setUp()
        stub = SearchAnimeUseCaseStub()
        dependencies = Dependencies(searchText: "pokemon",
                                    searchAnimeUseCase: stub)
    }
    
    override func tearDown() {
        sut = nil
        SearchAnimeUseCaseStub.response = nil
        SearchAnimeUseCaseStub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func test_WhenGetSeasonLater_ThenResponseFailed() {
        //given
        let expectation = expectation(description: "Search Result response failed")

        SearchAnimeUseCaseStub.response = TestsConstants.SearchAnimeConstants.emptyAnime
        
        //When
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getAnimes()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.animes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_WhenGetSeasonLater_ThenResponseSuccess() {
        //given
        let expectation = expectation(description: "Search Result response successfully")
        
        SearchAnimeUseCaseStub.response = TestsConstants.SearchAnimeConstants.searchAnime
        //given
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getAnimes()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.animes.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
