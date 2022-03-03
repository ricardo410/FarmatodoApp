//
//  TopAnimeRepositoryTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class TopAnimeRepositoryTest: XCTestCase {
    
    private var cancellable: AnyCancellable?
    private var sut: TopAnimeRepositoryType!
    private var stub: NetworkServiceStub<APITopAnimeMain>!
  
    override func setUp() {
        super.setUp()
        stub = NetworkServiceStub()
        sut = TopAnimeRepository(networkService: stub!)
    }
    
    override func tearDown() {
        sut = nil
        stub.response = nil
        stub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func testTopAnime_ReturnSuccess() throws {
    
        stub.response = .init(TestsConstants.TopAnimeConstant.apiTopAnimeMain)
        let test = validResponseTest(publisher: sut.getTopAnimes())
        wait(for: test.expectations, timeout: 0.5)
    }

    func testTopAnime_ReturnFailure() throws {
        
        stub.error = CustomErrors.APIRequest.emptyJson
        
        stub.response = .init(TestsConstants.TopAnimeConstant.emptyAPITopAnimeMain)
        
        let test = invalidResponseTest(publisher: sut.getTopAnimes())
        wait(for: test.expectations, timeout: 0.5)
    }
}
