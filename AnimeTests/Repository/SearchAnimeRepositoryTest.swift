//
//  SearchAnimeRepositoryTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class SearchAnimeRepositoryTest: XCTestCase {
    
    private var cancellable: AnyCancellable?
    private var sut: SearchAnimeRepositoryType!
    private var stub: NetworkServiceStub<APISearchAnime>!
  
    override func setUp() {
        super.setUp()
        stub = NetworkServiceStub()
        sut = SearchAnimeRepository(networkService: stub)
    }
    
    override func tearDown() {
        sut = nil
        stub.response = nil
        stub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func testSearchAnime_ReturnSuccess() throws {
    
        stub.response = .init(TestsConstants.SearchAnimeConstants.apiSearchAnime)
        let test = validResponseTest(publisher: sut.searchAnimes(query: "naruto"))
        wait(for: test.expectations, timeout: 0.5)
    }

    func testSearchAnime_ReturnFailure() throws {
        
        stub.error = CustomErrors.APIRequest.emptyJson
        
        stub.response = .init(TestsConstants.SearchAnimeConstants.emptyAPIAnime)
        
        let test = invalidResponseTest(publisher: sut.searchAnimes(query: ""))
        wait(for: test.expectations, timeout: 0.5)
    }
}
