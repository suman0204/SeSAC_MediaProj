//
//  URL+Extension.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation

extension URL {
    static let baseTrendURL = "https://api.themoviedb.org/3/trending/"
    static let baseTrendMovieURL = "https://api.themoviedb.org/3/trending/movie/"
    static let baseCreditURL = "https://api.themoviedb.org/3/movie/"
    
    static func makeMediaTypeURL(_ type: String) -> String {
        return baseTrendURL + type
    }
    
    static func makeTimeWindowURL(_ time: String) -> String {
        return baseTrendMovieURL + time
    }
    
    static func makeCreditsURL(_ id: String) -> String {
        return baseCreditURL + "\(id)/credits"
    }
    
    static func makeSimilarMovieURL(_ id: String) -> String {
        return baseCreditURL + "\(id)/similar"
    }

    static func makeMoiveVideosURL(_ id: String) -> String {
        return baseCreditURL + "\(id)/videos"
    }
}
