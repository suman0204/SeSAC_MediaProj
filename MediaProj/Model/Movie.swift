//
//  Movie.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation

//struct Movie {
//    let id: Int
//    let title: String
//    let posterPath: String
//    let backdropPath: String
//    let genreIDs: Int
//    let releaseDate: String
//    let voteAvg: Double
//
//    var posterURL: String {
//        return "https://image.tmdb.org/t/p/original\(posterPath)"
//    }
//
//    var backdropURL: String {
//        return "https://image.tmdb.org/t/p/original\(backdropPath)"
//    }
//
//    var voteAvgToText: String {
//        return String(format: "%.1f", voteAvg)
//    }
//}

// MARK: - Movie
struct TrendingMovie: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: OriginalLanguage
    let originalTitle, overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var posterURL: String {
        return "https://image.tmdb.org/t/p/original\(posterPath)"
    }
    
    var backdropURL: String {
        return "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    
    var voteAvgToText: String {
        return String(format: "%.1f", voteAverage)
    }

    var genreText: String {
        return genre[genreIDS[0]] ?? "장르 정보가 없습니다"
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    let genre = [
        28 : "Action",
        12 : "Adventure",
        16 : "Animation",
        35 : "Comedy",
        80 : "Crime",
        99 : "Documentary",
        18 : "Drama",
        10751 : "Family",
        14 : "Fantasy",
        36 : "History",
        27 : "Horror",
        10402 : "Music",
        9648 : "Mystery",
        10749 :"Romance",
        878 : "Science Fiction",
        10770 : "TV Movie",
        53 : "Thriller",
        10752 : "War",
        37 : "Western"
    ]
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
    case yo = "yo"
    case zh = "zh"
    case fr = "fr"
}
