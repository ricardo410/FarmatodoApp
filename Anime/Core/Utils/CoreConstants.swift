//
//  CoreConstants.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation

class CoreConstants {
    
    struct Urls {
        static let base = "https://api.jikan.moe/v3/"
        static let animeTop = "top/anime"
        static let seasonNow = "season/later"
        static let searchAnime = "search/anime"
        static let detailAnime = "anime/"
    }
    
    struct SystemImages {
        static let search = "magnifyingglass"
        static let star =  "star.fill"
        static let arrowBack = "arrow.backward"
    }
    
    struct Image {
        static let rotating = "arrow_rotating"
    }
    
    struct Values {
        static let empty = ""
        static let loadingMessage = "Connecting to API..."
        static let tryAgain = "Try Again"
    }
    
    struct HomeView {
        static let top = "Top Animes"
        static let season =  "New Seasons"
    }
    
    struct SearchResultView {
        static let title = "Results Animes"
        static let episodes = "Episodes: "
        static let score =  "Score: "
    }
    
    struct SearchView {
        static let cancel = "Cancel"
        static let search = "Search Anime"
    }
    
    struct DetailView {
        static let scoreBy = "ScoreBy: "
        static let episodes = "Episodes: "
        static let members =  "Members: "
        static let type =  "Type: "
        static let title =  "Detail"
        static let trailer = "Trailer"
        static let studio = "Studio"
        static let premier  = "Premier Date"
        static let score = "Score"
        static let rank = "Rank"
        static let popularity  = "Popularity"
        static let status = "Status"
    }
    
}
