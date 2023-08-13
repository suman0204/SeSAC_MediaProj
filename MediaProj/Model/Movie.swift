//
//  Movie.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let posterPath: String
    let backdropPath: String
    let genreIDs: Int
    let releaseDate: String
    let voteAvg: Double
    
    var posterURL: String {
        return "https://image.tmdb.org/t/p/original\(posterPath)"
    }
    
    var backdropURL: String {
        return "https://image.tmdb.org/t/p/original\(backdropPath)"
    }
    
    var voteAvgToText: String {
        return String(format: "%.1f", voteAvg)
    }
}
