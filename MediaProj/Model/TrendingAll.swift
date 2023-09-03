//
//  TrendingAll.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/09/03.
//

import Foundation

// MARK: - TrendingAll
struct TrendingAll: Codable {
    let page: Int
    let results: [TrendAllResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TrendAllResult: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String?
    let originalLanguage: String?
    let originalName: String?
    let overview, posterPath: String
    let mediaType: TrendAllMediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?
    
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
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
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

enum TrendAllMediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
    case person = "person"
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case ja = "ja"
//    case nl = "nl"
//    case sv = "sv"
//}
