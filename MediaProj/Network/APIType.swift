//
//  APIType.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/13.
//

import Foundation

//enum URLMediaType {
//    case all
//    case movie
//    case tv
//    case person
//
//    var requestURL: String {
//        switch self {
//        case .all:
//            return URL.makeMediaTypeURL("all/")
//        case .movie:
//            return URL.makeMediaTypeURL("movie/")
//        case .tv:
//            return URL.makeMediaTypeURL("tv/")
//        case .person:
//            return URL.makeMediaTypeURL("person/")
//        }
//    }
//
//    enum TimeWindow {
//        case day
//        case week
//
//        var requestURL: String {
//            switch self {
//            case
//            }
//        }
//    }
//}

enum TimeWindow {
    case day
    case week
    
    var requestURL: String {
        switch self {
        case .day:
            return URL.makeTimeWindowURL("day")
        case .week:
            return URL.makeTimeWindowURL("week")

        }
    }
}
