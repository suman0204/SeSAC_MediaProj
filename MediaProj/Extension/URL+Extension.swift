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
    static let baseCreditURL = "https://api.themoviedb.org/3/movie/872585/credits"
    
    static func makeMediaTypeURL(_ type: String) -> String {
        return baseTrendURL + type
    }
    
    static func makeTimeWindowURL(_ type: String) -> String {
        return baseTrendMovieURL + type
    }
}
