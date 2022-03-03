//
//  SeasonLaterRepositoryTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class SeasonLaterRepositoryTest: XCTestCase {
    
    private var cancellable: AnyCancellable?
    private var sut: SeasonLaterRepositoryType!
    private var stub: NetworkServiceStub<APISeasonLater>!
  
    override func setUp() {
        super.setUp()
        stub = NetworkServiceStub()
        sut = SeasonLaterRepository(networkService: stub)
    }
    
    override func tearDown() {
        sut = nil
        stub.response = nil
        stub.error = nil
        stub = nil
        super.tearDown()
    }

    func testSeasonLater_ReturnSuccess() throws {
    
        stub.response = .init(TestsConstants.SeasonLaterConstants.apiSeasonLater)
        let test = validResponseTest(publisher: sut.getSeasonLater())
        wait(for: test.expectations, timeout: 0.5)
    }

    func testSeasonLater_ReturnFailure() throws {
        
        stub.error = CustomErrors.APIRequest.emptyJson
        
        stub.response = .init(TestsConstants.SeasonLaterConstants.emptyAPISeasonLater)
        
        let test = invalidResponseTest(publisher: sut.getSeasonLater())
        wait(for: test.expectations, timeout: 0.5)
    }
}
