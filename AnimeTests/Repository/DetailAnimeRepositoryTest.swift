//
//  DetailAnimeRepositoryTest.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//

import XCTest
import Combine
@testable import Anime

class DetailAnimeRepositoryTest: XCTestCase {
    
    private var cancellable: AnyCancellable?
    private var sut: DetailAnimeRepositoryType!
    private var stub: NetworkServiceStub<APIDetailAnime>!
  
    override func setUp() {
        super.setUp()
        stub = NetworkServiceStub()
        sut = DetailAnimeRepository(networkService: stub)
    }
    
    override func tearDown() {
        sut = nil
        stub.response = nil
        stub.error = nil
        stub = nil
        super.tearDown()
    }
    
    func testDetailAnime_ReturnSuccess() throws {
    
        stub.response = .init(TestsConstants.DetailAnimeConstants.apiDetailAnime)
        let test = validResponseTest(publisher: sut.getDetail(id: 1))
        wait(for: test.expectations, timeout: 0.5)
    }

    func testDetailAnime_ReturnFailure() throws {
        
        stub.error = CustomErrors.APIRequest.emptyJson
        
        stub.response = .init(TestsConstants.DetailAnimeConstants.emptyAPIDetailAnime)
        
        let test = invalidResponseTest(publisher: sut.getDetail(id: 0))
        wait(for: test.expectations, timeout: 0.5)
    }
}
