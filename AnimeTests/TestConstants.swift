//
//  TestConstants.swift
//  AnimeTests
//
//  Created by William Ardila on 3/03/22.
//


@testable import Anime
import Foundation

struct TestsConstants {
    
    struct TopAnimeConstant {
        static let topAnime: TopAnime = {
            return TopAnime(rank: 1,
                            id: 1,
                            image: URL(string: "wwww.hhh.com"),
                            score: 2.0)
        }()
        
        static let apitopAnime: APITopAnime = {
            return APITopAnime(rank: 1,
                            id: 1,
                            image: URL(string: "wwww.hhh.com"),
                            score: 2.0)
        }()
        
        static let topAnimeMain: TopAnimeMain = {
            return TopAnimeMain(animes: [topAnime])
        }()
        
        
        static let apiTopAnimeMain: APITopAnimeMain = {
            return APITopAnimeMain(top: [apitopAnime])
        }()
        
        static let emptyTopAnime: TopAnimeMain = {
            return TopAnimeMain(animes: [])
        }()
        
        static let emptyAPITopAnimeMain: APITopAnimeMain = {
            return APITopAnimeMain(top: [])
        }()
    }
    
    struct SeasonLaterConstants {
        static let seasonLater: SeasonLater = {
            return SeasonLater(anime: [AnimeConstants.anime])
        }()
        
        
        static let emptySeason: SeasonLater = {
            return SeasonLater(anime: [])
        }()
        
        static let apiSeasonLater: APISeasonLater = {
            return APISeasonLater(anime: [AnimeConstants.apiAnime])
        }()
        
        static let emptyAPISeasonLater: APISeasonLater = {
            return APISeasonLater(anime: [])
        }()
        
    }
    
    struct AnimeConstants {
        static let anime: Anime = {
            return Anime(id: 1,
                         image: URL(string: "4324423.com"),
                         title: "title",
                         type: "type",
                         episodes: 2,
                         members: 4,
                         score: 0455,
                         synopsis: "synopsis")
        }()
        
        static let apiAnime: APIAnime = {
            return APIAnime(id: 1,
                            image: URL(string: "4324423.com"),
                            title: "title",
                            type: .init(rawValue: "anime"),
                            episodes: 2,
                            members: 4,
                            score: 0455,
                            synopsis: "synopsis")
        }()
        
        static let emptyAnime: Anime? = {
            return nil
        }()
    }
    
    
    struct SearchAnimeConstants {
        static let searchAnime: SearchAnime = {
            return SearchAnime(results: [AnimeConstants.anime])
        }()
        
        static let apiSearchAnime: APISearchAnime = {
            return APISearchAnime(results: [AnimeConstants.apiAnime])
        }()
        
        
        static let emptyAnime: SearchAnime = {
            return SearchAnime(results: [])
        }()
        static let emptyAPIAnime: APISearchAnime = {
            return APISearchAnime(results: [])
        }()
    }
    
    struct DetailAnimeConstants {

        static let detailAnime: DetailAnime = {
            return DetailAnime(id: 1,
                               image: URL(string: "WWW.COMERTT.COM"),
                               trailer: URL(string: "WWW.COMERTT.COM"),
                               title: "title",
                               titleEnglish: "titleEnglish",
                               synopsis: "synopsis",
                               type: "type",
                               episodes: 12,
                               score: 30.0,
                               scoredBy: 3,
                               members: 345,
                               rank: 5,
                               popularity: 445,
                               premieredDate: "2021",
                               rating: "rating",
                               status: "status",
                               studios: [shortDisplay],
                               genre: [shortDisplay])
        }()
        
        static let apiDetailAnime: APIDetailAnime = {
            return APIDetailAnime(id: 1,
                               image: URL(string: "WWW.COMERTT.COM"),
                               trailer: URL(string: "WWW.COMERTT.COM"),
                               title: "title",
                               titleEnglish: "titleEnglish",
                               synopsis: "synopsis",
                               type: .anime,
                               episodes: 12,
                               score: 30.0,
                               scoredBy: 3,
                               members: 345,
                               rank: 5,
                               popularity: 445,
                               premieredDate: "2021",
                               rating: "rating",
                               status: "status",
                               genres: [apiShortDisplay],
                              studios: [apiShortDisplay])
        }()
        
        static let apiShortDisplay: APIShortDisplay = {
            return APIShortDisplay(malID: 1, name: "name")
        }()
        
        static let shortDisplay: ShortDisplay = {
            return ShortDisplay(id: 1, name: "name")
        }()
        
        static let emptyDetailAnime: DetailAnime = {
            return DetailAnime(id: 0,
                               image: URL(string: ""),
                               trailer: URL(string: ""),
                               title: "",
                               titleEnglish: "",
                               synopsis: "",
                               type: "",
                               episodes: 0,
                               score: 0.0,
                               scoredBy: 0,
                               members: 0,
                               rank: 0,
                               popularity: 0,
                               premieredDate: "",
                               rating: "",
                               status: "",
                               studios: [],
                               genre: [])
            
         }()
        
        static let emptyAPIDetailAnime: APIDetailAnime = {
           return APIDetailAnime(id: 0,
                               image: URL(string: ""),
                               trailer: URL(string: ""),
                               title: "",
                               titleEnglish: "",
                               synopsis: "",
                               type: .init(rawValue: ""),
                               episodes: 0,
                               score: 0.0,
                               scoredBy: 0,
                               members: 0,
                               rank: 0,
                               popularity: 0,
                               premieredDate: "",
                               rating: "",
                               status: "",
                               genres: [],
                              studios: [])
         }()
    }
}
