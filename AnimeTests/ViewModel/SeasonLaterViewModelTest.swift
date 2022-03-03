//
//  SeasonLaterViewModelTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class SeasonLaterViewModelTest: XCTestCase {

    typealias Dependencies = SeasonLaterViewModel.Dependencies
    
    private var sut: SeasonLaterViewModel!
    private var dependencies: Dependencies!
    private var stub: SeasonLaterUseCaseStub!
    
    override func setUp() {
        super.setUp()
        stub = SeasonLaterUseCaseStub()
        dependencies = Dependencies(seasonLaterUseCase: stub)
    }
    
    override func tearDown() {
        sut = nil
        SeasonLaterUseCaseStub.response = nil
        SeasonLaterUseCaseStub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func test_WhenGetSeasonLater_ThenResponseFailed() {
        //given
        let expectation = expectation(description: "Season Later response failed")

        SeasonLaterUseCaseStub.response = TestsConstants.SeasonLaterConstants.emptySeason
        
        //When
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getSeasonLater()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.seasons.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_WhenGetSeasonLater_ThenResponseSuccess() {
        //given
        let expectation = expectation(description: "Season Later response successfully")
        
        SeasonLaterUseCaseStub.response = TestsConstants.SeasonLaterConstants.seasonLater
        //given
        sut = .init(dependencies: dependencies)
        
        //when
        sut.getSeasonLater()
        
        //then
        let result = XCTWaiter.wait(for: [expectation], timeout: 0.05)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.seasons.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
